import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/design_system/tokens/app_radius.dart';
import 'package:pokedex/design_system/tokens/app_typography.dart';

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

// ─── Extension — mapea enum a BottomNavigationBarItem ────────────────────────

extension _BottomNavTabX on BottomNavTab {
  BottomNavigationBarItem toNavItem(BuildContext context) {
    // Cuando integres l10n: context.l10n.homeTab, etc.
    switch (this) {
      case BottomNavTab.pokedex:
        return const BottomNavigationBarItem(
          icon: Icon(Icons.home),
          activeIcon: Icon(Icons.home),
          label: 'Pokedex',
        );
      case BottomNavTab.regions:
        return const BottomNavigationBarItem(
          icon: Icon(Icons.language),
          activeIcon: Icon(Icons.language),
          label: 'Region',
        );
      case BottomNavTab.favorites:
        return const BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          activeIcon: Icon(Icons.favorite),
          label: 'Favoritos',
        );
      case BottomNavTab.profile:
        return const BottomNavigationBarItem(
          icon: Icon(Icons.person),
          activeIcon: Icon(Icons.person),
          label: 'Perfil',
        );
    }
  }
}
