import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';


import 'user_event.dart';
import 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super (const UserInitialState(userStatus.LOGGED_IN)) {
    on<UserEvent>((event, emit) =>{
      emit(UserInitialState((state as UserInitialState).mode == userStatus.LOGGED_IN ? userStatus.LOGGED_OUT : userStatus.LOGGED_IN))
    });
  }
}