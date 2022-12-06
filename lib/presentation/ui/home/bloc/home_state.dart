import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  final int index;

  const HomeState({
    this.index = 0,
  });

  HomeState copyWith({
    int? index,
  }) =>
      HomeState(
        index: index ?? this.index,
      );

  @override
  List<Object?> get props => [index];
}
