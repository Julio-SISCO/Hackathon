import 'package:equatable/equatable.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}
enum userStatus  {LOGGED_OUT, LOGGED_IN}


class UserInitialState extends UserState {
  final userStatus  mode;

  const UserInitialState(this.mode);

  @override
  List<Object> get props => [
    mode,
  ];
}