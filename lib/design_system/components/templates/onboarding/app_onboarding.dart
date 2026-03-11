import 'package:flutter/material.dart';
import 'package:pokedex/design_system/tokens/app_spacing.dart';

import '../../../../../design_system/components/atoms/app_button.dart';
import '../../../../../design_system/components/atoms/app_dots_indicator.dart';
import '../../../../../design_system/tokens/app_colors.dart';
import 'models/onboarding_item_model.dart';
import 'renders/render_onboarding_item.dart';

class AppOnboarding extends StatefulWidget {
  const AppOnboarding({
    required this.pages,
    required this.onContinuePressed,
    super.key,
  });

  final List<OnboardingItemModel> pages;
  final VoidCallback onContinuePressed;

  @override
  State<AppOnboarding> createState() => _AppOnboardingState();
}

class _AppOnboardingState extends State<AppOnboarding> {
  late int _page;
  late PageController _controller;
  late AppButton _bottomButton;

  static const int animationDuration = 200;

  @override
  void initState() {
    super.initState();
    _page = 0;
    _validateButton();
    _controller = PageController();
    _controller.addListener(() {
      if (_controller.page?.round() != _page) {
        setState(() {
          _page = _controller.page?.round() ?? 0;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final int length = widget.pages.length;

    final AppDotsIndicator dots = AppDotsIndicator(
      controller: _controller,
      indicatorCount: length,
    );

    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: AppColors.surface,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: .stretch,
            mainAxisSize: .min,
            children: [
              Flexible(
                child: PageView.builder(
                  controller: _controller,
                  itemCount: length,
                  itemBuilder: (BuildContext context, int index) {
                    return RenderOnboardingItem(
                      item: widget.pages[index % length],
                      dots: dots,
                    );
                  },
                  onPageChanged: _onPageChanged,
                ),
              ),
              SizedBox(height: AppSpacing.lg),
              Padding(
                padding: const EdgeInsetsGeometry.only(
                  left: AppSpacing.md,
                  right: AppSpacing.md,
                  bottom: AppSpacing.xxl,
                ),
                child: _bottomButton,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _validateButton() {
    final String btnText = widget.pages[_page].buttonTitle;
    _bottomButton = AppButton(
      text: btnText,
      onPressed: _page == widget.pages.length - 1
          ? () {
              widget.onContinuePressed.call();
            }
          : _nextStep,
    );
  }

  void _nextStep() {
    setState(() {
      _controller.animateToPage(
        _page + 1,
        duration: const Duration(milliseconds: animationDuration),
        curve: Curves.linear,
      );
    });
  }

  void _onPageChanged(int index) {
    setState(() {
      _page = index;
      _validateButton();
    });
  }
}
