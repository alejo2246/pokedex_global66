import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:pokedex/design_system/tokens/app_radius.dart';

import '../../tokens/app_colors.dart';

class AppDotsIndicator extends StatefulWidget {
  final PageController controller;
  final int indicatorCount;

  const AppDotsIndicator({
    required this.controller,
    required this.indicatorCount,
    super.key,
  });

  @override
  State<AppDotsIndicator> createState() => _AppDotsIndicatorState();
}

class _AppDotsIndicatorState extends State<AppDotsIndicator> {
  double _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _currentPage = widget.controller.initialPage.toDouble();
    widget.controller.addListener(_onPageChanged);
  }

  void _onPageChanged() {
    setState(() {
      _currentPage = widget.controller.page ?? _currentPage;
    });
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onPageChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(widget.indicatorCount, (index) {
        final distance = (_currentPage - index).abs();
        final isActive = distance < 0.5;

        final width = isActive
            ? lerpDouble(28.0, 9.0, (distance * 2).clamp(0.0, 1.0))!
            : 9.0;
        final color = isActive
            ? Color.lerp(
                AppColors.blueNormal,
                AppColors.blueSemiLight.withValues(alpha: 0.25),
                (distance * 2).clamp(0.0, 1.0),
              )!
            : AppColors.blueSemiLight.withValues(alpha: 0.25);

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            curve: Curves.easeInOut,
            width: width,
            height: 9,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.all(AppRadius.borderRadius3),
            ),
          ),
        );
      }),
    );
  }
}
