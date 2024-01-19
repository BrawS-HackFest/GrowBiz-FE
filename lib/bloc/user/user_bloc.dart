

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:hackfest_mobile/models/user_model.dart';
import 'package:hackfest_mobile/repository/user_repository.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;
  UserBloc({required this.userRepository}) : super(UserInitial()) {
    on<UserWorkFetched>((event, emit) async{
      try{
        emit(UserLoading());
        final userData = await userRepository.getALlWorkers();
        emit(UserWorkSuccess(userData: userData.userWorkData));
      }catch(e){
        emit(UserFailed(e.toString()));
      }
    });
  }
}
