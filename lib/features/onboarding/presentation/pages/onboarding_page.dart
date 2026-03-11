import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/design_system/components/templates/onboarding/app_onboarding.dart';
import 'package:pokedex/design_system/components/templates/onboarding/models/onboarding_item_model.dart';

import '../../../../core/router/route_names.dart';
import '../../domain/usecases/mark_onboarding_seen_usecase.dart';

class OnboardingPage extends ConsumerWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppOnboarding(
      pages: const [
        OnboardingItemModel(
          title: 'Todos los Pokémon en un solo lugar',
          description:
              'Accede a una amplia lista de Pokémon de todas las generaciones creadas por Nintendo',
          image: 'onboarding_image_1.png',
          buttonTitle: 'Continuar',
        ),
        OnboardingItemModel(
          title: 'Mantén tu Pokédex actualizada',
          description:
              'Regístrate y guarda tu perfil, Pokémon favoritos, configuraciones y mucho más en la aplicación',
          image: 'onboarding_image_2.png',
          buttonTitle: 'Empecemos',
        ),
      ],
      onContinuePressed: () async {
        await ref.read(markOnboardingSeenUseCaseProvider).call();
        if (context.mounted) context.goNamed(AppRoute.pokedex);
      },
    );
  }
}
