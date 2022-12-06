import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/presentation/ui/onboarding/bloc/onboarding_event.dart';
import 'package:todo_list/presentation/ui/onboarding/bloc/onboarding_state.dart';

import '../../../../domain/repositories/app_repositories.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  final AppRepository _appRepository;

  OnboardingBloc(this._appRepository) : super(const OnboardingState()) {
    on<OnboardingNextPage>(_nextPage);
    on<OnboardingPreviousPage>(_previousPage);
    on<OnboardingOnTabChanged>(_changeTab);
    on<OnboardingSkip>(_moveToStartScreen);
  }

  Future<void> _nextPage(
    OnboardingNextPage event,
    Emitter<OnboardingState> emitter,
  ) async {
    var index = state.index;
    if (index < 2) index = index + 1;
    return emitter(state.copyWith(index: index));
  }

  Future<void> _previousPage(
    OnboardingPreviousPage event,
    Emitter<OnboardingState> emitter,
  ) async {
    var index = state.index;
    if (index > 0) index = index - 1;
    return emitter(state.copyWith(index: index));
  }

  Future<void> _changeTab(
    OnboardingOnTabChanged event,
    Emitter<OnboardingState> emitter,
  ) async {
    return emitter(state.copyWith(
      index: event.index,
      isStart: event.index == 0,
      isEnd: event.index == 2,
    ));
  }

  Future<void> _moveToStartScreen(
    OnboardingSkip event,
    Emitter<OnboardingState> emitter,
  ) async {
    await _appRepository.setIsOnboardingSuccessful();
    
    return emitter(state.copyWith(moveToStartScreen: true));
  }
}
