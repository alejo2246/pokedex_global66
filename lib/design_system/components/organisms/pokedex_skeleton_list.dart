import 'package:flutter/material.dart';

import '../../tokens/app_spacing.dart';
import '../molecules/pokemon_card_skeleton.dart';

class PokedexSkeletonList extends StatelessWidget {
  final int skeletonCount;
  const PokedexSkeletonList({this.skeletonCount = 10, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(AppSpacing.md),
      separatorBuilder: (context, index) => SizedBox(height: AppSpacing.md),
      itemCount: skeletonCount,
      itemBuilder: (_, _) => const PokemonCardSkeleton(),
    );
  }
}
