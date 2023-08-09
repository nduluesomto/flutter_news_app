class HomeSubCatState {
  final int index;
  const HomeSubCatState({this.index = 0});

  HomeSubCatState copyWith({int? index}) {
    return HomeSubCatState(index: index ?? this.index);
  }
}
