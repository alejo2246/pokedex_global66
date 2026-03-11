import 'package:flutter/material.dart';
import 'package:pokedex/design_system/tokens/app_colors.dart';
import 'package:pokedex/design_system/tokens/app_spacing.dart';
import 'package:pokedex/design_system/tokens/app_typography.dart';

class AppMultiSelect<T> extends StatefulWidget {
  final String title;
  final List<T> items;
  final Set<T> selected;
  final String Function(T item) labelBuilder;
  final void Function(T item) onToggle;
  final bool initiallyExpanded;

  const AppMultiSelect({
    super.key,
    required this.title,
    required this.items,
    required this.selected,
    required this.labelBuilder,
    required this.onToggle,
    this.initiallyExpanded = true,
  });

  @override
  State<AppMultiSelect<T>> createState() => _AppMultiSelectState<T>();
}

class _AppMultiSelectState<T> extends State<AppMultiSelect<T>> {
  late bool _expanded;

  @override
  void initState() {
    super.initState();
    _expanded = widget.initiallyExpanded;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () => setState(() => _expanded = !_expanded),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: AppSpacing.sl),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.title, style: AppTypography.fontStyle5Semibold),
                AnimatedRotation(
                  turns: _expanded ? 0 : 0.5,
                  duration: const Duration(milliseconds: 200),
                  child: const Icon(
                    Icons.keyboard_arrow_up,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ),
        const Divider(height: 1, color: AppColors.tapBarBorder),
        if (_expanded)
          Expanded(
            child: ListView.separated(
              itemCount: widget.items.length,
              separatorBuilder: (_, _) =>
                  const Divider(height: 1, color: AppColors.tapBarBorder),
              itemBuilder: (context, index) {
                final item = widget.items[index];
                final isSelected = widget.selected.contains(item);
                return InkWell(
                  onTap: () => widget.onToggle(item),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.xs,
                      vertical: AppSpacing.sl,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.labelBuilder(item),
                          style: AppTypography.fontStyle4Medium.copyWith(
                            color: AppColors.textPrimary,
                          ),
                        ),
                        _AppCheckbox(value: isSelected),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        if (!_expanded)
          const Divider(height: 1, color: AppColors.tapBarBorder),
      ],
    );
  }
}

class _AppCheckbox extends StatelessWidget {
  final bool value;

  const _AppCheckbox({required this.value});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        color: value ? AppColors.primary : Colors.transparent,
        border: Border.all(
          color: value ? AppColors.primary : AppColors.tapBarBorder,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: value
          ? const Icon(Icons.check, size: 14, color: Colors.white)
          : null,
    );
  }
}
