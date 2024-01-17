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
        if (e.code == 'email-already-in-use') {
          emit(AuthError(error: 'Email sudah digunakan. Gunakan email lain.'));
        }else {
          emit(AuthError(error: 'Terjadi kesalahan: ${e.message}'));
        }
      }catch(e){
        emit(AuthError(error: e.toString()));
      }
    });
    on<LoginEvent>((event, emit)async{
      try{
        emit(AuthLoading());
        String email = event.email;
        String password = event.password;

        final credential = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
        final user = _firebaseAuth.currentUser;
        if(user!.emailVerified){
          final user = credential.user!;
          IdTokenResult token = await user.getIdTokenResult();
          String clearToken = '${token.token}';
          emit(AuthSuccess(token:  clearToken.replaceAll('\n', '')));
        }
        else {
            await user.sendEmailVerification();
            emit(AuthError(error: 'Email belum diverifikasi. Silahkan cek email Anda untuk verifikasi.'));
        }
      }on FirebaseAuthException catch(e){
        if (e.code == 'user-not-found') {
          emit(AuthError(error: 'User tidak ditemukan. Silahkan daftar terlebih dahulu.'));
        } else if (e.code == 'wrong-password') {
          emit(AuthError(error: 'Password salah. Silahkan coba lagi.'));
        } else {
          emit(AuthError(error: 'Terjadi kesalahan: ${e.message}'));
        }
      }catch(e){
        emit(AuthError(error: e.toString()));
      }
    });
    on<LogoutEvent>((event, emit)async {
      try{
        emit(AuthLoading());
        await _firebaseAuth.signOut();
        emit(LogoutSuccess());
      }catch(e){
        emit(LogoutError(e.toString()));
      }
    });
    on<UpdatePassEvent>((event, emit) async{
      try{
        emit(AuthLoading());
        String password = event.password;
        String confirmPassword = event.confirmPassword;
        if(password != confirmPassword){
          emit(UpdatePassFailed('Password dan konfirmasi password tidak sama, silahkan coba lagi'));
        }else{
          await _firebaseAuth.currentUser!.updatePassword(password);
          emit(UpdatePassSuccess());
        }
      }on FirebaseAuthException catch (e){
        emit(UpdatePassFailed(e.message.toString()));
      }catch(e){
        emit(UpdatePassFailed(e.toString()));
      }
    });
  }
}
