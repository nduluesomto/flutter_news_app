part of 'home_bloc.dart';

abstract class HomeEvent {
  const HomeEvent();
}

class HomeNavigatorEvent extends HomeEvent {
  final int index;
  const HomeNavigatorEvent({required this.index});
}
