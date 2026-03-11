import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../onboarding/domain/usecases/check_onboarding_seen_usecase.dart';

part 'splash_viewmodel.g.dart';

enum SplashDestination { onboarding, home }

@riverpod
class SplashViewModel extends _$SplashViewModel {
  @override
  Future<SplashDestination> build() async {
    await Future.delayed(const Duration(seconds: 4));
    final hasSeen = await ref.read(checkOnboardingSeenUseCaseProvider).call();
    return hasSeen ? SplashDestination.home : SplashDestination.onboarding;
  }
}
