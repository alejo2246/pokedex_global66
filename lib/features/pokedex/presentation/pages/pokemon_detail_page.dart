import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/core/constants/pokemon_type.dart';
import 'package:pokedex/core/utils/string_helper.dart';
import 'package:pokedex/design_system/components/molecules/app_error_state.dart';
import 'package:pokedex/design_system/theme/pokemon_type_theme.dart';
import 'package:pokedex/design_system/tokens/app_radius.dart';

import '../../../../design_system/components/atoms/favorite_icon.dart';
import '../../../../design_system/components/atoms/type_badge.dart';
import '../../../../design_system/tokens/app_colors.dart';
import '../../../../design_system/tokens/app_spacing.dart';
import '../../../../design_system/tokens/app_typography.dart';
import '../../../favorites/presentation/viewmodels/favorites_viewmodel.dart';
import '../../domain/entities/pokemon.dart';
import '../../domain/entities/pokemon_detail.dart';
import '../viewmodels/pokemon_detail_viewmodel.dart';

class PokemonDetailPage extends ConsumerWidget {
  final String pokemonId;
  final Pokemon pokemon;

  const PokemonDetailPage({
    super.key,
    required this.pokemonId,
    required this.pokemon,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final id = int.parse(pokemonId);
    final state = ref.watch(pokemonDetailViewModelProvider(id));

    final String imageUrl = pokemon.imageUrl;
    final String name = pokemon.name;
    final PokemonType type = pokemon.types.firstOrNull ?? PokemonType.normal;
    final favState = ref.watch(favoritesViewModelProvider).value;
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.only(left: AppSpacing.md),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios_rounded),
            color: AppColors.surface,
            iconSize: AppSpacing.lg,
            onPressed: () => context.pop(),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: AppSpacing.xl),
            child: FavoriteIcon(
              isFavorite: favState?.isFavorite(pokemon.id) ?? false,
              onFavorite: () => ref
                  .read(favoritesViewModelProvider.notifier)
                  .toggleFavorite(pokemon),
              showBg: false,
              size: FavoritIconSize.lg,
            ),
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: CustomScrollView(
        slivers: [
          _PokemonSliverHeader(
            id: id,
            name: name,
            imageUrl: imageUrl,
            type: type,
          ),
          SliverPadding(
            padding: EdgeInsetsGeometry.symmetric(
              vertical: AppSpacing.md,
              horizontal: AppSpacing.sl,
            ),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                Text(
                  StringHelper.capitalize(name),
                  style: AppTypography.fontStyle8Medium,
                ),
                SizedBox(height: AppSpacing.sm),
                Text(
                  StringHelper.formatId(pokemonId),
                  style: AppTypography.fontStyle2SemiBold.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
                SizedBox(height: AppSpacing.lg),
                _TypeRow(types: pokemon.types),
                SizedBox(height: AppSpacing.sm),
              ]),
            ),
          ),
          switch (state) {
            AsyncLoading() => const SliverFillRemaining(
              child: Center(child: CircularProgressIndicator()),
            ),
            AsyncError(:final error) => SliverFillRemaining(
              child: AppErrorState(
                title: 'Algo salio mal...',
                subtitle: error.toString(),
                onRetry: () =>
                    ref.invalidate(pokemonDetailViewModelProvider(id)),
              ),
            ),
            AsyncData(:final value) => _DetailSliverContent(detail: value),
          },
        ],
      ),
    );
  }
}

class _PokemonSliverHeader extends StatelessWidget {
  final int id;
  final String name;
  final String imageUrl;
  final PokemonType type;

  const _PokemonSliverHeader({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    final typeColor = type.primaryColor;
    final double width = MediaQuery.of(context).size.width;
    final double circleSize = width * 1.4;

    return SliverToBoxAdapter(
      child: SizedBox(
        height: 340,
        child: Stack(
          clipBehavior: Clip.hardEdge,
          children: [
            Positioned(
              top: -circleSize / 2,
              left: -(circleSize / 2) + width / 2,
              child: Container(
                width: circleSize,
                height: circleSize,
                decoration: BoxDecoration(
                  color: typeColor,
                  shape: BoxShape.circle,
                ),
              ),
            ),

            Positioned.fill(
              child: Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 35),
                  child: SizedBox(
                    width: 204,
                    height: 204,
                    child: ShaderMask(
                      blendMode: BlendMode.dstIn,
                      shaderCallback: (bounds) => const LinearGradient(
                        begin: Alignment(-0.54, -0.84),
                        end: Alignment(0.54, 0.84),
                        colors: [Colors.white, Colors.transparent],
                      ).createShader(bounds),
                      child: SvgPicture.asset(
                        type.iconAssetBlackAndWhite,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Hero(
                  tag: 'pokemon-image-$id',
                  child: CachedNetworkImage(
                    imageUrl: imageUrl,
                    height: 180,
                    fit: BoxFit.contain,
                    errorWidget: (_, _, _) => const Icon(
                      Icons.catching_pokemon_rounded,
                      size: 100,
                      color: AppColors.textDisabled,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DetailSliverContent extends StatelessWidget {
  final PokemonDetail detail;

  const _DetailSliverContent({required this.detail});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
      sliver: SliverList(
        delegate: SliverChildListDelegate([
          Text(
            detail.description,
            style: AppTypography.fontStyle3Regular.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          Divider(color: AppColors.tapBarBorder),
          const SizedBox(height: AppSpacing.lg),
          _InfoGrid(detail: detail),
          const SizedBox(height: AppSpacing.md),
          Text('Debilidades', style: AppTypography.fontStyle5Medium),
          const SizedBox(height: AppSpacing.sm),
          detail.weaknesses.isEmpty
              ? Text(
                  'Sin debilidades conocidas',
                  style: AppTypography.fontStyle3Regular.copyWith(
                    color: AppColors.textDisabled,
                  ),
                )
              : _TypeRow(types: detail.weaknesses),

          const SizedBox(height: AppSpacing.xl),
        ]),
      ),
    );
  }
}

class _TypeRow extends StatelessWidget {
  final List<PokemonType> types;

  const _TypeRow({required this.types});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: AppSpacing.md,
      runSpacing: AppSpacing.md,
      alignment: WrapAlignment.start,
      children: types.map((type) => TypeBadge(type: type)).toList(),
    );
  }
}

class _InfoGrid extends StatelessWidget {
  final PokemonDetail detail;

  const _InfoGrid({required this.detail});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      mainAxisSize: .min,
      children: [
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          mainAxisSpacing: AppSpacing.md,
          crossAxisSpacing: AppSpacing.md,
          mainAxisExtent: 69,
          padding: EdgeInsets.zero,
          children: [
            _InfoCell(
              icon: 'weight.svg',
              label: 'Peso',
              value: '${detail.weightKg.toStringAsFixed(1)} kg',
            ),
            _InfoCell(
              icon: 'height.svg',
              label: 'Altura',
              value: '${detail.heightM.toStringAsFixed(1)} m',
            ),

            _InfoCell(
              icon: 'category.svg',
              label: 'Categoría',
              value: detail.category,
            ),
            _InfoCell(
              icon: 'pokeball.svg',
              label: 'Habilidad',
              value: StringHelper.capitalize(detail.abilities.firstOrNull?.name ?? '—'),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.md),
        _GenderBar(genderRate: detail.genderRate),
      ],
    );
  }
}

class _InfoCell extends StatelessWidget {
  final String icon;
  final String label;
  final String value;

  const _InfoCell({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: .start,
          crossAxisAlignment: .center,
          children: [
            SvgPicture.asset(
              'assets/icons/$icon',
              width: AppSpacing.md,
              height: AppSpacing.md,
              colorFilter: ColorFilter.mode(
                AppColors.textSecondary,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(width: AppSpacing.xs),
            Text(
              label.toUpperCase(),
              style: AppTypography.fontStyle2Medium.copyWith(
                color: AppColors.textSecondary,
                letterSpacing: 0.6,
              ),
            ),
          ],
        ),

        const SizedBox(height: AppSpacing.xs),
        Container(
          padding: EdgeInsets.all(AppSpacing.sm),
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.tapBarBorder),
            borderRadius: BorderRadius.all(AppRadius.borderRadius3),
          ),
          child: Center(
            child: Text(
              value,
              style: AppTypography.fontStyle5Medium,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }
}

class _GenderBar extends StatelessWidget {
  final int genderRate;

  const _GenderBar({required this.genderRate});

  static const Color _maleColor = Color(0xFF4D6FE8);
  static const Color _femaleColor = Color(0xFFE86FA0);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'GENERO',
          style: AppTypography.fontStyle2Medium.copyWith(
            color: AppColors.textSecondary,
            letterSpacing: 0.8,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: AppSpacing.sm),
        if (genderRate == -1) _buildGenderlessBar() else _buildRatioBar(),
      ],
    );
  }

  Widget _buildGenderlessBar() {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: const SizedBox(
            height: 12,
            child: ColoredBox(color: AppColors.bgBtnSecondary),
          ),
        ),
        const SizedBox(height: AppSpacing.xs),
        Text(
          'Sin género',
          style: AppTypography.fontStyle2Medium.copyWith(
            color: AppColors.textDisabled,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildRatioBar() {
    final int female = genderRate;
    final int male = 8 - genderRate;
    final double femalePct = genderRate / 8;
    final double malePct = 1.0 - femalePct;

    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: SizedBox(
            width: double.infinity,
            height: 12,
            child: Row(
              children: [
                if (male > 0)
                  Expanded(
                    flex: male,
                    child: Container(color: _maleColor),
                  ),
                if (female > 0)
                  Expanded(
                    flex: female,
                    child: Container(color: _femaleColor),
                  ),
              ],
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.xs),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Icon(Icons.male_rounded, size: 18, color: _maleColor),
                const SizedBox(width: AppSpacing.xxs),
                Text(
                  '${_fmt(malePct)}%',
                  style: AppTypography.fontStyle2Medium.copyWith(
                    color: _maleColor,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Icon(Icons.female_rounded, size: 18, color: _femaleColor),
                const SizedBox(width: AppSpacing.xxs),
                Text(
                  '${_fmt(femalePct)}%',
                  style: AppTypography.fontStyle2Medium.copyWith(
                    color: _femaleColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  String _fmt(double pct) {
    final val = pct * 100;
    return val == val.truncateToDouble()
        ? val.toInt().toString()
        : val.toStringAsFixed(1);
  }
}
