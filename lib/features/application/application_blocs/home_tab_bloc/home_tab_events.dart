import 'package:equatable/equatable.dart';

abstract class HomeTabEvent extends Equatable {
  const HomeTabEvent();

  @override
  List<Object> get props => [];
}

class ChangeTab extends HomeTabEvent {
  const ChangeTab();

  @override
  List<Object> get props => [];
}
