import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/domain/repositories/app_repositories.dart';
import 'package:todo_list/presentation/navigation/todo_navigation.dart';
import 'package:todo_list/presentation/ui/splash/bloc/splash_event.dart';
import 'package:todo_list/presentation/ui/splash/bloc/splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final AppRepository _appRepository;

  SplashBloc(this._appRepository) : super(const SplashState()) {
    on<SplashMovedToRoute>(_movedToRoute);
  }

  Future<void> _movedToRoute(
    SplashEvent event,
    Emitter<SplashState> emitter,
  ) async {
    await Future.delayed(const Duration(seconds: 3));
    final routerPath = _appRepository.isOnboardingSuccessful()
        ? RouterPath.start
        : RouterPath.onboarding;
    return emitter(SplashState(routePath: routerPath));
  }
}
