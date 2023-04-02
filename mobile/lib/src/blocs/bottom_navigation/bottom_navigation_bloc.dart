import 'dart:async';

import 'package:bloc/bloc.dart';

import 'bottom_navigation_event.dart';

class BottomNavigationBloc extends Bloc<BottomNavigationEvent, int> {

  BottomNavigationBloc() : super(0) {
    on<TabChangeEvent>(((event, emit) => emit(event.newIndex)));
  }

}