import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedex/design_system/tokens/app_radius.dart';
import 'package:pokedex/design_system/tokens/app_typography.dart';

import '../../tokens/app_colors.dart';

enum AppButtonType { primary, secondary }

enum AppButtonStatus { default_, disabled, loading }

class AppButton extends StatefulWidget {
  final AppButtonType type;
  final AppButtonStatus status;
  final String text;
  final bool showIconLeft;
  final String? iconLeft;
  final bool showIconRight;
  final String? iconRight;
  final VoidCallback? onPressed;

  const AppButton({
    super.key,
    this.type = AppButtonType.primary,
    this.status = AppButtonStatus.default_,
    required this.text,
    this.showIconLeft = false,
    this.iconLeft,
    this.showIconRight = false,
    this.iconRight,
    this.onPressed,
  });

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  bool _pressed = false;

  bool get _isDisabled => widget.status == AppButtonStatus.disabled;
  bool get _isLoading => widget.status == AppButtonStatus.loading;

  Color get _backgroundColor {
    if (_isDisabled) return AppColors.bgBtnDisabled;
    if (widget.type == AppButtonType.primary) {
      return _pressed ? AppColors.bgBtnPrimaryPressed : AppColors.primary;
    } else {
      return _pressed
          ? AppColors.bgBtnSecondaryPressed
          : AppColors.bgBtnSecondary;
    }
  }

  Color get _textColor {
    if (_isDisabled) return AppColors.textDisabled;
    return widget.type == AppButtonType.primary
        ? AppColors.surface
        : AppColors.textPrimary;
  }

  void _onTapDown(_) => setState(() => _pressed = true);
  void _onTapUp(_) => setState(() => _pressed = false);
  void _onTapCancel() => setState(() => _pressed = false);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _isDisabled || _isLoading ? null : _onTapDown,
      onTapUp: _isDisabled || _isLoading ? null : _onTapUp,
      onTapCancel: _isDisabled || _isLoading ? null : _onTapCancel,
      onTap: _isDisabled || _isLoading ? null : widget.onPressed,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 120),
        height: 48,
        width: double.infinity,
        decoration: BoxDecoration(
          color: _backgroundColor,
          borderRadius: BorderRadius.all(AppRadius.borderRadiusFull),
        ),
        child: Center(
          child: _isLoading
              ? _DotsLoader(color: _textColor)
              : _ButtonContent(
                  text: widget.text,
                  textColor: _textColor,
                  showIconLeft: widget.showIconLeft,
                  iconLeft: widget.iconLeft,
                  showIconRight: widget.showIconRight,
                  iconRight: widget.iconRight,
                ),
        ),
      ),
    );
  }
}

class _ButtonContent extends StatelessWidget {
  final String text;
  final Color textColor;
  final bool showIconLeft;
  final String? iconLeft;
  final bool showIconRight;
  final String? iconRight;

  const _ButtonContent({
    required this.text,
    required this.textColor,
    required this.showIconLeft,
    required this.iconLeft,
    required this.showIconRight,
    required this.iconRight,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (showIconLeft && iconLeft != null) ...[
          SvgPicture.asset(
            iconLeft!,
            width: 20,
            height: 20,
            colorFilter: ColorFilter.mode(textColor, BlendMode.srcIn),
          ),
          const SizedBox(width: 8),
        ],
        Text(
          text,
          style: AppTypography.fontStyle5Semibold.copyWith(color: textColor),
          textAlign: TextAlign.center,
        ),
        if (showIconRight && iconRight != null) ...[
          const SizedBox(width: 8),
          SvgPicture.asset(
            iconRight!,
            width: 20,
            height: 20,
            colorFilter: ColorFilter.mode(textColor, BlendMode.srcIn),
          ),
        ],
      ],
    );
  }
}

class _DotsLoader extends StatefulWidget {
  final Color color;

  const _DotsLoader({required this.color});

  @override
  State<_DotsLoader> createState() => _DotsLoaderState();
}

class _DotsLoaderState extends State<_DotsLoader>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(3, (i) {
            final delay = i / 3;
            final t = ((_controller.value - delay) % 1.0 + 1.0) % 1.0;
            final scale = 0.5 + 0.5 * _bounce(t);
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Transform.scale(
                scale: scale,
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: widget.color,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            );
          }),
        );
      },
    );
  }

  double _bounce(double t) {
    // sine wave: 0 → 1 → 0 in the first half, flat in the second half
    if (t < 0.5) return (1 - (2 * t - 1) * (2 * t - 1));
    return 0.0;
  }
}
