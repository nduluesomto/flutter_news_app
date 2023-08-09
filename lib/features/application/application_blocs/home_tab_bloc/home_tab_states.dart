import 'package:equatable/equatable.dart';

class HomeTabState extends Equatable {
  final bool tabStatus;

  const HomeTabState({
    this.tabStatus = true,
  });

  @override
  List<Object?> get props => [tabStatus];

  HomeTabState changeTab() {
    return HomeTabState(tabStatus: !tabStatus);
  }
}
