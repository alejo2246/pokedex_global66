import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/onboarding_repository_impl.dart';
import '../repositories/onboarding_repository.dart';

class CheckOnboardingSeenUseCase {
  final OnboardingRepository _repository;

  CheckOnboardingSeenUseCase(this._repository);

  Future<bool> call() => _repository.hasSeenOnboarding();
}

final checkOnboardingSeenUseCaseProvider = Provider<CheckOnboardingSeenUseCase>(
  (ref) => CheckOnboardingSeenUseCase(ref.read(onboardingRepositoryProvider)),
);
