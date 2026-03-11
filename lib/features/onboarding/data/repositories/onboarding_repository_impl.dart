import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/repositories/onboarding_repository.dart';
import '../datasources/onboarding_local_datasource.dart';

class OnboardingRepositoryImpl implements OnboardingRepository {
  final OnboardingLocalDataSource _dataSource;

  OnboardingRepositoryImpl(this._dataSource);

  @override
  Future<bool> hasSeenOnboarding() => _dataSource.hasSeenOnboarding();

  @override
  Future<void> markOnboardingSeen() => _dataSource.markOnboardingSeen();
}

final onboardingRepositoryProvider = Provider<OnboardingRepository>(
  (ref) =>
      OnboardingRepositoryImpl(ref.watch(onboardingLocalDataSourceProvider)),
);
