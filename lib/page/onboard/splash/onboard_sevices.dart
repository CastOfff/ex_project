

import '../../../data/local_storage/app_preferences.dart';

class OnboardStorageKey {
  static const String isFirstOpenKey = 'is_first_open_key';
}

class OnboardService {
  static void saveOnboardToLocal() {
    final pres = AppPreference.preferences;
    pres?.setBool(OnboardStorageKey.isFirstOpenKey, false);
  }

  static bool isFirstOpen() {
    final pres = AppPreference.preferences;
    return pres?.getBool(OnboardStorageKey.isFirstOpenKey) ?? true;
  }
}