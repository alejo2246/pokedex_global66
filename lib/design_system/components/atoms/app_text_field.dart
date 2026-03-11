import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../tokens/app_colors.dart';
import '../../tokens/app_radius.dart';
import '../../tokens/app_spacing.dart';
import '../../tokens/app_typography.dart';

enum AppTextFieldStatus { default_, disabled, error }

class AppTextField extends StatefulWidget {
  final String? label;
  final String? hint;
  final String? errorMessage;
  final AppTextFieldStatus status;
  final bool obscureText;
  final String? iconLeft;
  final String? iconRight;
  final VoidCallback? onIconRightPressed;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final ValueChanged<String>? onChanged;
  final FocusNode? focusNode;

  const AppTextField({
    super.key,
    this.label,
    this.hint,
    this.errorMessage,
    this.status = AppTextFieldStatus.default_,
    this.obscureText = false,
    this.iconLeft,
    this.iconRight,
    this.onIconRightPressed,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.focusNode,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late final FocusNode _focusNode;
  bool _isFocused = false;

  bool get _isDisabled => widget.status == AppTextFieldStatus.disabled;
  bool get _isError => widget.status == AppTextFieldStatus.error;

  Color get _labelColor {
    if (_isError) return AppColors.textError;
    if (_isFocused) return AppColors.primary;
    if (_isDisabled) return AppColors.textDisabled;
    return AppColors.textSecondary;
  }

  static const String iconPath = 'assets/icons/';
  static const double iconSize = 20;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    setState(() => _isFocused = _focusNode.hasFocus);
  }

  @override
  void dispose() {
    if (widget.focusNode == null) _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.label != null) ...[
          Text(
            widget.label!,
            style: AppTypography.fontStyle3Medium.copyWith(color: _labelColor),
          ),
          const SizedBox(height: AppSpacing.xs),
        ],
        TextField(
          controller: widget.controller,
          focusNode: _focusNode,
          enabled: !_isDisabled,
          obscureText: widget.obscureText,
          keyboardType: widget.keyboardType,
          onChanged: widget.onChanged,
          style: AppTypography.fontStyle3Regular.copyWith(
            color: AppColors.textPrimary,
          ),
          decoration: InputDecoration(
            hintText: widget.hint,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(AppRadius.borderRadius5),
              borderSide: BorderSide(width: 1.5, color: AppColors.tapBarBorder),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(AppRadius.borderRadius5),
              borderSide: BorderSide(width: 1.5, color: AppColors.primary),
            ),
            hintStyle: AppTypography.fontStyle3Regular.copyWith(
              color: AppColors.textDisabled,
            ),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.md,
              vertical: AppSpacing.sl,
            ),
            prefixIcon: widget.iconLeft != null
                ? Padding(
                    padding: const EdgeInsets.only(
                      left: AppSpacing.md,
                      right: AppSpacing.sm,
                    ),
                    child: SvgPicture.asset(
                      '$iconPath${widget.iconLeft!}',
                      width: iconSize,
                      height: iconSize,
                      colorFilter: ColorFilter.mode(
                        AppColors.textDisabled,
                        BlendMode.srcIn,
                      ),
                    ),
                  )
                : null,
            prefixIconConstraints: const BoxConstraints(),
            suffixIcon: widget.iconRight != null
                ? GestureDetector(
                    onTap: widget.onIconRightPressed,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: AppSpacing.sm,
                        right: AppSpacing.md,
                      ),
                      child: SvgPicture.asset(
                        '$iconPath${widget.iconRight!}',
                        width: iconSize,
                        height: iconSize,
                        colorFilter: ColorFilter.mode(
                          AppColors.textDisabled,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  )
                : null,
            suffixIconConstraints: const BoxConstraints(),
          ),
        ),

        if (_isError && widget.errorMessage != null) ...[
          const SizedBox(height: AppSpacing.xs),
          Text(
            widget.errorMessage!,
            style: AppTypography.fontStyle1Medium.copyWith(
              color: AppColors.textError,
            ),
          ),
        ],
      ],
    );
  }
}
