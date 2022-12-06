import 'package:equatable/equatable.dart';

class OnboardingState extends Equatable {
  final int index;
  final bool isStart;
  final bool isEnd;
  final bool moveToStartScreen;

  const OnboardingState({
    this.index = 0,
    this.isStart = true,
    this.isEnd = false,
    this.moveToStartScreen = false,
  });

  OnboardingState copyWith({
    int? index,
    bool? isStart,
    bool? isEnd,
    bool? moveToStartScreen,
  }) =>
      OnboardingState(
        index: index ?? this.index,
        isStart: isStart ?? this.isStart,
        isEnd: isEnd ?? this.isEnd,
        moveToStartScreen: moveToStartScreen ?? this.moveToStartScreen,
      );

  @override
  List<Object?> get props => [
        index,
        isStart,
        isEnd,
        moveToStartScreen,
      ];
}
