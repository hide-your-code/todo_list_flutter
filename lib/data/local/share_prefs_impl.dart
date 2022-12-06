import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list/data/local/share_prefs.dart';

class SharePrefsImpl implements SharePrefs {
  final SharedPreferences _prefs;

  const SharePrefsImpl(this._prefs);

  @override
  Future<void> setIsOnboardingSuccessful() async {
    await _prefs.setBool(_PrefsKey.keyIsOnboardingSuccessful, true);
  }

  @override
  bool isOnboardingSuccessful() =>
      _prefs.getBool(_PrefsKey.keyIsOnboardingSuccessful) ?? false;
}

class _PrefsKey {
  static const keyIsOnboardingSuccessful = 'IS_ONBOARDING_SUCCESSFUL';
}
