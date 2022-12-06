abstract class HomeEvent {
  const HomeEvent();
}

class HomeChangeIndex extends HomeEvent {
  final int index;

  const HomeChangeIndex({required this.index});
}
