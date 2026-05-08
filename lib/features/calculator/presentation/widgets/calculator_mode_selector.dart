import 'package:elearn_mobile/core/theme/app_colors.dart';
import 'package:elearn_mobile/core/theme/theme_extensions.dart';
import 'package:flutter/material.dart';

class CalculatorModeSelector extends StatelessWidget {
  const CalculatorModeSelector({
    super.key,
    required this.modes,
    required this.selectedIndex,
    required this.onChanged,
  });

  final List<String> modes;
  final int selectedIndex;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.extension<AppCustomColors>()!;

    return Container(
      height: 48,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: colors.subjectCardBackground,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: colors.subjectCardBorder),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final itemWidth = constraints.maxWidth / modes.length;

          return Stack(
            children: [
              AnimatedPositioned(
                duration: const Duration(milliseconds: 260),
                curve: Curves.easeOutCubic,
                left: itemWidth * selectedIndex,
                top: 0,
                bottom: 0,
                width: itemWidth,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary,
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withOpacity(0.18),
                        blurRadius: 14,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  for (var index = 0; index < modes.length; index++)
                    Expanded(
                      child: InkWell(
                        borderRadius: BorderRadius.circular(14),
                        onTap: () => onChanged(index),
                        child: Center(
                          child: AnimatedDefaultTextStyle(
                            duration: const Duration(milliseconds: 180),
                            curve: Curves.easeOut,
                            style: theme.textTheme.labelLarge!.copyWith(
                              color: selectedIndex == index
                                  ? AppColors.n900
                                  : colors.subjectCardTitle,
                              fontWeight: FontWeight.w800,
                            ),
                            child: Text(
                              modes[index],
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
