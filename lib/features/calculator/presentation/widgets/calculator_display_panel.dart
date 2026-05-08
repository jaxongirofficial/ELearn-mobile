import 'package:elearn_mobile/core/theme/app_colors.dart';
import 'package:elearn_mobile/core/theme/theme_extensions.dart';
import 'package:flutter/material.dart';

class CalculatorDisplayPanel extends StatelessWidget {
  const CalculatorDisplayPanel({
    super.key,
    required this.expression,
    required this.result,
  });

  final String expression;
  final String result;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.extension<AppCustomColors>()!;

    return Container(
      height: 116,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            colors.subjectCardBackground,
            AppColors.secondary.withOpacity(0.18),
          ],
        ),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: colors.subjectCardBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            expression.isEmpty ? '0' : expression,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.right,
            style: theme.textTheme.titleLarge?.copyWith(
              color: colors.subjectCardDescription,
              fontWeight: FontWeight.w700,
            ),
          ),
          const Spacer(),
          FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerRight,
            child: Text(
              result.isEmpty ? '0' : result,
              textAlign: TextAlign.right,
              style: theme.textTheme.displaySmall?.copyWith(
                color: colors.subjectCardTitle,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
