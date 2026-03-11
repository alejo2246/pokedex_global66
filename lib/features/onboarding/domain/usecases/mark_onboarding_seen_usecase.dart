import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/onboarding_repository_impl.dart';
import '../repositories/onboarding_repository.dart';

class MarkOnboardingSeenUseCase {
  final OnboardingRepository _repository;

  MarkOnboardingSeenUseCase(this._repository);

  Future<void> call() => _repository.markOnboardingSeen();
}

final markOnboardingSeenUseCaseProvider = Provider<MarkOnboardingSeenUseCase>(
  (ref) => MarkOnboardingSeenUseCase(ref.read(onboardingRepositoryProvider)),
);
