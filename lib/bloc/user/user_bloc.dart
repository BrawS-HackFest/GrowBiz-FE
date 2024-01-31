

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:GrowBiz/models/user_model.dart';
import 'package:GrowBiz/repository/user_repository.dart';

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
    on<UserWorkDetailFetched>((event, emit) async{
      try{
        emit(UserLoading());
        final userWorkDetail = await userRepository.getUserWorkDetail(event.id);
        emit(UserWorkDetailSuccess(userWorkDetail: userWorkDetail));
      }catch(e){
        emit(UserFailed(e.toString()));
      }
    });
  }
}
