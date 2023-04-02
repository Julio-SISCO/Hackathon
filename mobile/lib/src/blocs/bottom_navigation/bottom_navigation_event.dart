import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class BottomNavigationEvent extends Equatable {
  const BottomNavigationEvent();
}

class TabChangeEvent extends BottomNavigationEvent {

  final int newIndex;
  const TabChangeEvent(this.newIndex);

  @override
  // TODO: implement props
  List<Object?> get props => [];

}
