import 'package:elearn_mobile/core/theme/app_colors.dart';
import 'package:elearn_mobile/core/theme/theme_extensions.dart';
import 'package:flutter/material.dart';

class CalculatorInput {
  const CalculatorInput(
    this.value, [
    String? label,
    this.opensGroup = false,
    this.isConstant = false,
  ]) : label = label ?? value;

  final String value;
  final String label;
  final bool opensGroup;
  final bool isConstant;
}

class CalculatorKeypad extends StatelessWidget {
  const CalculatorKeypad({
    super.key,
    required this.selectedMode,
    required this.onInsert,
    required this.onBackspace,
    required this.onClear,
    required this.onEvaluate,
  });

  static const _numberRows = [
    ['AC', '(', ')', 'back'],
    ['7', '8', '9', '÷'],
    ['4', '5', '6', '×'],
    ['1', '2', '3', '−'],
    ['0', '.', '%', '+'],
    ['00', 'e', 'xʸ', '='],
  ];

  static const _subjectRows = [
    [
      ['sin', 'cos', 'tan', '√'],
      ['log', 'ln', 'π', 'xʸ'],
    ],
    [
      ['g', 'c', 'G', 'h'],
      ['kB', 'qe', 'atm', 'eV'],
    ],
    [
      ['Nₐ', 'R', 'pH', 'pOH'],
      ['Kw', '22.4L', 'F', 'log'],
    ],
  ];

  static const _functionInserts = {
    '√': 'sqrt(',
    'log': 'log(',
    'sin': 'sin(',
    'cos': 'cos(',
    'tan': 'tan(',
    'ln': 'ln(',
  };

  static const _insertValues = {
    'π': 'pi',
    'g': '9.80665',
    'c': '299792458',
    'h': '6.62607015e-34',
    'G': '6.67430e-11',
    'kB': '1.380649e-23',
    'qe': '1.602176634e-19',
    'atm': '101325',
    'eV': '1.602176634e-19',
    'Nₐ': '6.02214076e23',
    'R': '8.314462618',
    'Kw': '1e-14',
    '22.4L': '22.414',
    'F': '96485.33212',
  };

  final int selectedMode;
  final ValueChanged<CalculatorInput> onInsert;
  final VoidCallback onBackspace;
  final VoidCallback onClear;
  final VoidCallback onEvaluate;

  @override
  Widget build(BuildContext context) {
    final rows = [..._subjectRows[selectedMode], ..._numberRows];

    return LayoutBuilder(
      builder: (context, constraints) {
        const gap = 7.0;
        final keyHeight = ((constraints.maxHeight - gap * (rows.length - 1)) /
                rows.length)
            .clamp(0.0, 49.0)
            .toDouble();

        return Column(
          children: [
            for (final row in rows) ...[
              SizedBox(
                height: keyHeight,
                child: Row(
                  children: [
                    for (final key in row) ...[
                      Expanded(
                        child: _CalculatorKey(
                          label: key,
                          compact: keyHeight < 46,
                          onTap: _tapFor(key),
                        ),
                      ),
                      if (key != row.last) const SizedBox(width: 9),
                    ],
                  ],
                ),
              ),
              if (row != rows.last) const SizedBox(height: gap),
            ],
          ],
        );
      },
    );
  }

  VoidCallback _tapFor(String key) {
    if (key == 'AC') return onClear;
    if (key == 'back') return onBackspace;
    if (key == '=') return onEvaluate;
    if (key == '%') return () => onInsert(const CalculatorInput('/100', '%'));
    if (key == 'pH') {
      return () => onInsert(const CalculatorInput('-log(', 'pH(', true));
    }
    if (key == 'pOH') return () => onInsert(const CalculatorInput('14-', '14−'));
    if (key == '÷') return () => onInsert(const CalculatorInput('/', '÷'));
    if (key == '×') return () => onInsert(const CalculatorInput('*', '×'));
    if (key == '−') return () => onInsert(const CalculatorInput('-', '−'));
    if (key == 'xʸ') return () => onInsert(const CalculatorInput('^', '^'));
    if (_functionInserts.containsKey(key)) {
      return () => onInsert(
            CalculatorInput(_functionInserts[key]!, '$key(', true),
          );
    }
    return () => onInsert(
          CalculatorInput(
            _insertValues[key] ?? key,
            key,
            false,
            _insertValues.containsKey(key),
          ),
        );
  }
}

class _CalculatorKey extends StatelessWidget {
  const _CalculatorKey({
    required this.label,
    required this.compact,
    required this.onTap,
  });

  static const _subjectTools = {
    '√',
    'log',
    'sin',
    'cos',
    'tan',
    'ln',
    'π',
    'g',
    'c',
    'h',
    'G',
    'kB',
    'qe',
    'atm',
    'eV',
    'Nₐ',
    'R',
    'Kw',
    '22.4L',
    'F',
    'pH',
    'pOH',
  };
  static const _operatorTools = {'+', '−', '×', '÷', 'xʸ', '(', ')', '%'};

  final String label;
  final bool compact;
  final VoidCallback onTap;

  bool get _isPrimary => label == '=';
  bool get _isUtility => label == 'AC' || label == 'back';
  bool get _isSubjectTool => _subjectTools.contains(label);
  bool get _isOperator => _operatorTools.contains(label);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.extension<AppCustomColors>()!;
    final background = _backgroundColor(theme, colors);
    final foreground = _isPrimary ? AppColors.n900 : colors.subjectCardTitle;

    return Material(
      color: background,
      borderRadius: BorderRadius.circular(17),
      child: InkWell(
        borderRadius: BorderRadius.circular(17),
        onTap: onTap,
        child: Center(
          child: label == 'back'
              ? Icon(
                  Icons.backspace_outlined,
                  color: foreground,
                  size: compact ? 17 : 20,
                )
              : Text(
                  label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: foreground,
                    fontSize: compact ? 14 : null,
                    fontWeight: FontWeight.w900,
                  ),
                ),
        ),
      ),
    );
  }

  Color _backgroundColor(ThemeData theme, AppCustomColors colors) {
    if (_isPrimary) return theme.colorScheme.primary;
    if (_isUtility) return AppColors.secondary.withOpacity(0.26);
    if (_isSubjectTool) return AppColors.primary.withOpacity(0.16);
    if (_isOperator) return AppColors.secondary.withOpacity(0.17);
    return colors.subjectCardBackground;
  }
}
