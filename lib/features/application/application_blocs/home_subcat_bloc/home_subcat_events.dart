abstract class HomeSubCatEvent {
  const HomeSubCatEvent();
}

class ChangeIndex extends HomeSubCatEvent {
  final int index;
  const ChangeIndex(this.index);
}
