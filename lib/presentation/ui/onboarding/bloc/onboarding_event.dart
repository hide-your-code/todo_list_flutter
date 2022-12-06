import 'package:equatable/equatable.dart';

abstract class OnboardingEvent extends Equatable {
  const OnboardingEvent();

  @override
  List<Object?> get props => [];
}

class OnboardingNextPage extends OnboardingEvent {
  const OnboardingNextPage();
}

class OnboardingPreviousPage extends OnboardingEvent {
  const OnboardingPreviousPage();
}

class OnboardingOnTabChanged extends OnboardingEvent {
  final int index;

  const OnboardingOnTabChanged({required this.index});
}

class OnboardingSkip extends OnboardingEvent {
  const OnboardingSkip();
}
