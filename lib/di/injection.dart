import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list/data/local/share_prefs.dart';
import 'package:todo_list/data/local/share_prefs_impl.dart';
import 'package:todo_list/data/repositories/app_repository_impl.dart';
import 'package:todo_list/domain/repositories/app_repositories.dart';
import 'package:todo_list/presentation/ui/home/bloc/home_bloc.dart';
import 'package:todo_list/presentation/ui/login/bloc/login_bloc.dart';
import 'package:todo_list/presentation/ui/onboarding/bloc/onboarding_bloc.dart';
import 'package:todo_list/presentation/ui/register/bloc/register_bloc.dart';
import 'package:todo_list/presentation/ui/splash/bloc/splash_bloc.dart';
import 'package:todo_list/presentation/ui/start/bloc/start_bloc.dart';

GetIt getIt = GetIt.instance;

Future<void> configureDependencies() async {
  // Local data
  getIt.registerSingletonAsync<SharedPreferences>(() async {
    return await SharedPreferences.getInstance();
  });

  getIt.registerSingletonWithDependencies<SharePrefs>(
    () => SharePrefsImpl(getIt.get()),
    dependsOn: [SharedPreferences],
  );

  // Repositories
  getIt.registerSingletonWithDependencies<AppRepository>(
    () => AppRepositoryImpl(getIt.get<SharePrefs>()),
    dependsOn: [SharePrefs],
  );

  // Blocs
  // Because I need to wait all singletons are initialized. Not sure it's the correct way.
  await getIt.allReady();

  getIt.registerFactory(() => SplashBloc(getIt.get<AppRepository>()));
  getIt.registerFactory(() => OnboardingBloc(getIt.get<AppRepository>()));
  getIt.registerFactory(() => StartBloc());
  getIt.registerFactory(() => LoginBloc());
  getIt.registerFactory(() => RegisterBloc());
  getIt.registerFactory(() => HomeBloc());
}
