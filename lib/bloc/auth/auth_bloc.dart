import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:hackfest_mobile/repository/auth_repository.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final AuthRepository authRepository = AuthRepository();
  AuthBloc() : super(AuthInitial()) {
    on<RegisterEvent>((event, emit) async{
      try{
        emit(AuthLoading());
        String email = event.email;
        String password = event.password;
        String confirmPassword = event.confirmPassword;

        if(password != confirmPassword){
          emit(RegisterError(error: 'password dan confirm password harus sama'));
          return;
        }else{
          await _firebaseAuth.createUserWithEmailAndPassword(
            email: email,
            password: password,
          );
          try{
            final uid = _firebaseAuth.currentUser!.uid;
            final emailUser = _firebaseAuth.currentUser!.email;
            await authRepository.registerRepository(uid, emailUser.toString());
            await _firebaseAuth.currentUser!.sendEmailVerification();
            emit(RegisterSuccess());
          }catch(e){
            await _firebaseAuth.currentUser!.delete();
            emit(AuthError(error: e.toString()));
          }
        }
      }on FirebaseAuthException catch(e){
        emit(AuthError(error: e.message!));
      }catch(e){
        emit(AuthError(error: e.toString()));
      }
    });
    on<LoginEvent>((event, emit)async{
      try{
        emit(AuthLoading());
        String email = event.email;
        String password = event.password;

        final isUserVerified  = _firebaseAuth.currentUser;
        if(isUserVerified?.emailVerified ?? false){
          _firebaseAuth.currentUser!.sendEmailVerification();
          emit(AuthError(error: 'Email belum diverifikasi silahkan verifikasi akun anda!'));
        }
        await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
        final user = _firebaseAuth.currentUser!;
        IdTokenResult token = await user.getIdTokenResult();
        emit(AuthSuccess(token:  token.token.toString()));
      }on FirebaseAuthException catch(e){
        emit(AuthError(error: e.message!));
      }catch(e){
        emit(AuthError(error: e.toString()));
      }
    });
  }
}
