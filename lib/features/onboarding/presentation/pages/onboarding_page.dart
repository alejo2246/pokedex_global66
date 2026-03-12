import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/design_system/components/templates/onboarding/app_onboarding.dart';
import 'package:pokedex/design_system/components/templates/onboarding/models/onboarding_item_model.dart';
import 'package:pokedex/l10n/l10n.dart';

import '../../../../core/router/route_names.dart';
import '../../domain/usecases/mark_onboarding_seen_usecase.dart';

class OnboardingPage extends ConsumerWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppOnboarding(
      pages: [
        OnboardingItemModel(
          title: context.l10n.onboarding1Title,
          description: context.l10n.onboarding1Description,
          image: 'onboarding_image_1.png',
          buttonTitle: context.l10n.onboarding1Button,
        ),
        OnboardingItemModel(
          title: context.l10n.onboarding2Title,
          description: context.l10n.onboarding2Description,
          image: 'onboarding_image_2.png',
          buttonTitle: context.l10n.onboarding2Button,
        ),
      ],
      onContinuePressed: () async {
        await ref.read(markOnboardingSeenUseCaseProvider).call();
        if (context.mounted) context.goNamed(AppRoute.pokedex);
      },
    );
  }
}
