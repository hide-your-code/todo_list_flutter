import 'package:todo_list/data/local/share_prefs.dart';
import 'package:todo_list/domain/repositories/app_repositories.dart';

class AppRepositoryImpl implements AppRepository {
  final SharePrefs _sharePrefs;

  const AppRepositoryImpl(this._sharePrefs);

  @override
  bool isOnboardingSuccessful() => _sharePrefs.isOnboardingSuccessful();

  @override
  Future<void> setIsOnboardingSuccessful() =>
      _sharePrefs.setIsOnboardingSuccessful();
}
