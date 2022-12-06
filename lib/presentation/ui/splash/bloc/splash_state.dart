import 'package:equatable/equatable.dart';
import 'package:todo_list/presentation/navigation/todo_navigation.dart';

class SplashState extends Equatable {
  final String routePath;

  const SplashState({
    this.routePath = RouterPath.onboarding,
  });

  SplashState copyWith(
    String? routePath,
  ) =>
      SplashState(
        routePath: routePath ?? this.routePath,
      );

  @override
  List<Object?> get props => [routePath];
}
