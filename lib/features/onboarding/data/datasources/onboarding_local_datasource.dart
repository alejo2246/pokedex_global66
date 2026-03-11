import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/data/local/shared_preferences/shared_preferences_provider.dart';

abstract class OnboardingLocalDataSource {
  Future<bool> hasSeenOnboarding();
  Future<void> markOnboardingSeen();
}

class OnboardingLocalDataSourceImpl implements OnboardingLocalDataSource {
  final SharedPreferences _prefs;
  static const _key = 'has_seen_onboarding';

  OnboardingLocalDataSourceImpl(this._prefs);

  @override
  Future<bool> hasSeenOnboarding() async => _prefs.getBool(_key) ?? false;

  @override
  Future<void> markOnboardingSeen() async => _prefs.setBool(_key, true);
}

final onboardingLocalDataSourceProvider = Provider<OnboardingLocalDataSource>(
  (ref) =>
      OnboardingLocalDataSourceImpl(ref.watch(sharedPreferencesProvider)),
);
