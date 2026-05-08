import 'package:elearn_mobile/core/theme/app_colors.dart';
import 'package:elearn_mobile/core/theme/theme_extensions.dart';
import 'package:elearn_mobile/features/calculator/domain/calculator_expression_parser.dart';
import 'package:elearn_mobile/features/calculator/presentation/widgets/calculator_display_panel.dart';
import 'package:elearn_mobile/features/calculator/presentation/widgets/calculator_keypad.dart';
import 'package:elearn_mobile/features/calculator/presentation/widgets/calculator_mode_selector.dart';
import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  static const _modeTitles = ['Math', 'Physics', 'Chemistry'];

  var _result = '0';
  var _selectedMode = 0;
  var _justEvaluated = false;
  final List<CalculatorInput> _inputs = [];

  String get _expression => _inputs.map((input) => input.value).join();
  String get _displayExpression => _inputs.map((input) => input.label).join();
  String get _calculationExpression => _closeOpenParentheses(_expression);

  void _insert(CalculatorInput input) {
    setState(() {
      if (_justEvaluated && _startsFresh(input.value)) _inputs.clear();
      _justEvaluated = false;
      if (_needsImplicitMultiply(input)) {
        _inputs.add(const CalculatorInput('*', '×'));
      }
      _inputs.add(input);
      _updatePreview();
    });
  }

  void _backspace() {
    if (_inputs.isEmpty) return;
    setState(() {
      _inputs.removeLast();
      _justEvaluated = false;
      _updatePreview();
    });
  }

  void _clear() {
    setState(() {
      _inputs.clear();
      _result = '0';
      _justEvaluated = false;
    });
  }

  void _changeMode(int index) {
    if (index == _selectedMode) return;
    setState(() {
      _selectedMode = index;
      _inputs.clear();
      _result = '0';
      _justEvaluated = false;
    });
  }

  void _handleSwipe(DragEndDetails details) {
    final velocity = details.primaryVelocity ?? 0;
    if (velocity.abs() < 260) return;

    final nextIndex = velocity < 0 ? _selectedMode + 1 : _selectedMode - 1;
    if (nextIndex < 0 || nextIndex >= _modeTitles.length) return;
    _changeMode(nextIndex);
  }

  void _evaluate() {
    if (_expression.trim().isEmpty) return;
    try {
      final result = _formatNumber(
        CalculatorExpressionParser(_calculationExpression).parse(),
      );
      setState(() {
        _inputs
          ..clear()
          ..add(CalculatorInput(result));
        _result = result;
        _justEvaluated = true;
      });
    } on FormatException {
      setState(() => _result = 'Error');
    }
  }

  void _updatePreview() {
    if (_expression.trim().isEmpty) {
      _result = '0';
      return;
    }
    try {
      _result = _formatNumber(
        CalculatorExpressionParser(_calculationExpression).parse(),
      );
    } on FormatException {
      _result = '';
    }
  }

  bool _needsImplicitMultiply(CalculatorInput next) {
    if (_inputs.isEmpty) return false;
    if (!_lastTokenIsValue) return false;
    return next.opensGroup || next.isConstant;
  }

  bool get _lastTokenIsValue {
    final value = _inputs.last.value;
    final label = _inputs.last.label;
    return value == ')' ||
        value == 'pi' ||
        value == 'e' ||
        label == '%' ||
        RegExp(r'[0-9.]$').hasMatch(value);
  }

  String _closeOpenParentheses(String expression) {
    var balance = 0;
    for (final codeUnit in expression.codeUnits) {
      final char = String.fromCharCode(codeUnit);
      if (char == '(') balance++;
      if (char == ')' && balance > 0) balance--;
    }
    return balance == 0 ? expression : expression + List.filled(balance, ')').join();
  }

  bool _startsFresh(String value) {
    return value == '.' ||
        value == '(' ||
        value == '-log(' ||
        RegExp(r'^[0-9a-zA-Z]').hasMatch(value);
  }

  String _formatNumber(double value) {
    if (value.isNaN || value.isInfinite) {
      throw const FormatException('Invalid result');
    }
    if (value.abs() >= 100000000000 || value.abs() < 0.000001 && value != 0) {
      return value.toStringAsExponential(8).replaceFirst(RegExp(r'\.?0+e'), 'e');
    }
    return value.toStringAsFixed(10).replaceFirst(RegExp(r'\.?0+$'), '');
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.extension<AppCustomColors>()!;

    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 0,
        backgroundColor: theme.colorScheme.background,
      ),
      body: SafeArea(
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onHorizontalDragEnd: _handleSwipe,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _CalculatorHeader(
                  title: _modeTitles[_selectedMode],
                  icon: _iconForMode(_selectedMode),
                ),
                const SizedBox(height: 10),
                CalculatorModeSelector(
                  modes: _modeTitles,
                  selectedIndex: _selectedMode,
                  onChanged: _changeMode,
                ),
                const SizedBox(height: 10),
                CalculatorDisplayPanel(
                  expression: _displayExpression,
                  result: _result,
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: CalculatorKeypad(
                    selectedMode: _selectedMode,
                    onInsert: _insert,
                    onBackspace: _backspace,
                    onClear: _clear,
                    onEvaluate: _evaluate,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  IconData _iconForMode(int index) {
    if (index == 1) return Icons.bolt_rounded;
    if (index == 2) return Icons.science_rounded;
    return Icons.functions_rounded;
  }
}

class _CalculatorHeader extends StatelessWidget {
  const _CalculatorHeader({
    super.key,
    required this.title,
    required this.icon,
  });

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.extension<AppCustomColors>()!;

    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: theme.textTheme.headlineSmall?.copyWith(
              color: colors.subjectCardTitle,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.14),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Icon(icon, color: theme.colorScheme.primary, size: 22),
        ),
      ],
    );
  }
}
