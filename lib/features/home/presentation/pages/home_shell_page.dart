import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/design_system/tokens/app_radius.dart';
import 'package:pokedex/design_system/tokens/app_typography.dart';
import 'package:pokedex/l10n/l10n.dart';

import '../../../../core/router/app_router.dart';
import '../../../../design_system/tokens/app_colors.dart';

class HomeShellPage extends StatelessWidget {
  const HomeShellPage({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  void _onTabTapped(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: _AppBottomNavBar(
        currentIndex: navigationShell.currentIndex,
        onTap: _onTabTapped,
      ),
    );
  }
}

class _AppBottomNavBar extends StatelessWidget {
  const _AppBottomNavBar({required this.currentIndex, required this.onTap});

  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    final tabs = BottomNavTab.values;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: const BorderRadius.only(
          topLeft: AppRadius.borderRadius3,
          topRight: AppRadius.borderRadius3,
        ),
        border: const Border(top: BorderSide(color: AppColors.tapBarBorder)),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 3,
            offset: Offset(0, -1),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: AppRadius.borderRadius3,
          topRight: AppRadius.borderRadius3,
        ),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: onTap,
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.surface,
          selectedItemColor: AppColors.textActive,
          unselectedItemColor: AppColors.textSecondary,
          selectedLabelStyle: AppTypography.fontStyle1Bold.copyWith(
            color: AppColors.textActive,
          ),
          unselectedLabelStyle: AppTypography.fontStyle1Medium.copyWith(
            color: AppColors.textSecondary,
          ),
          elevation: 0,
          items: tabs.map((tab) => tab.toNavItem(context)).toList(),
        ),
      ),
    );
  }
}


extension _BottomNavTabX on BottomNavTab {
  BottomNavigationBarItem toNavItem(BuildContext context) {

    switch (this) {
      case BottomNavTab.pokedex:
        return BottomNavigationBarItem(
          icon: const Icon(Icons.home),
          activeIcon: const Icon(Icons.home),
          label: context.l10n.navPokedex,
        );
      case BottomNavTab.regions:
        return BottomNavigationBarItem(
          icon: const Icon(Icons.language),
          activeIcon: const Icon(Icons.language),
          label: context.l10n.navRegions,
        );
      case BottomNavTab.favorites:
        return BottomNavigationBarItem(
          icon: const Icon(Icons.favorite),
          activeIcon: const Icon(Icons.favorite),
          label: context.l10n.navFavorites,
        );
      case BottomNavTab.profile:
        return BottomNavigationBarItem(
          icon: const Icon(Icons.person),
          activeIcon: const Icon(Icons.person),
          label: context.l10n.navProfile,
        );
    }
  }
}
