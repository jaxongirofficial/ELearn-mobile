import 'dart:math' as math;

class CalculatorExpressionParser {
  CalculatorExpressionParser(this.source);

  final String source;
  var _index = 0;

  double parse() {
    final value = _parseExpression();
    _skipWhitespace();
    if (_index != source.length) {
      throw FormatException('Unexpected token at $_index');
    }
    return value;
  }

  double _parseExpression() {
    var value = _parseTerm();
    while (true) {
      _skipWhitespace();
      if (_match('+')) {
        value += _parseTerm();
      } else if (_match('-')) {
        value -= _parseTerm();
      } else {
        return value;
      }
    }
  }

  double _parseTerm() {
    var value = _parsePower();
    while (true) {
      _skipWhitespace();
      if (_match('*') || _match('x') || _match('X')) {
        value *= _parsePower();
      } else if (_match('/')) {
        final divisor = _parsePower();
        if (divisor == 0) throw const FormatException('Division by zero');
        value /= divisor;
      } else {
        return value;
      }
    }
  }

  double _parsePower() {
    var value = _parseUnary();
    _skipWhitespace();
    if (_match('^')) value = math.pow(value, _parsePower()).toDouble();
    return value;
  }

  double _parseUnary() {
    _skipWhitespace();
    if (_match('+')) return _parseUnary();
    if (_match('-')) return -_parseUnary();
    return _parsePrimary();
  }

  double _parsePrimary() {
    _skipWhitespace();

    if (_match('(')) {
      final value = _parseExpression();
      if (!_match(')')) throw const FormatException('Missing )');
      return value;
    }

    if (_peekIsLetter()) {
      final name = _parseName().toLowerCase();
      if (name == 'pi') return math.pi;
      if (name == 'e') return math.e;
      if (!_match('(')) throw FormatException('Function $name needs ()');

      final argument = _parseExpression();
      if (!_match(')')) throw const FormatException('Missing )');
      return _call(name, argument);
    }

    return _parseNumber();
  }

  double _parseNumber() {
    _skipWhitespace();
    final start = _index;
    var hasDigit = false;

    while (_index < source.length) {
      final char = source[_index];
      if (_isDigit(char)) {
        hasDigit = true;
        _index++;
      } else if (char == '.') {
        _index++;
      } else {
        break;
      }
    }

    if (_index < source.length && source[_index].toLowerCase() == 'e') {
      final exponentStart = _index++;
      if (_index < source.length &&
          (source[_index] == '+' || source[_index] == '-')) {
        _index++;
      }
      final digitStart = _index;
      while (_index < source.length && _isDigit(source[_index])) {
        _index++;
      }
      if (digitStart == _index) _index = exponentStart;
    }

    if (!hasDigit) throw FormatException('Expected number at $_index');
    return double.parse(source.substring(start, _index));
  }

  double _call(String name, double argument) {
    switch (name) {
      case 'sin':
        return math.sin(argument * math.pi / 180);
      case 'cos':
        return math.cos(argument * math.pi / 180);
      case 'tan':
        return math.tan(argument * math.pi / 180);
      case 'sqrt':
        return math.sqrt(argument);
      case 'ln':
        return math.log(argument);
      case 'log':
        return math.log(argument) / math.ln10;
      default:
        throw FormatException('Unknown function $name');
    }
  }

  String _parseName() {
    final start = _index;
    while (_index < source.length && _peekIsLetter()) {
      _index++;
    }
    return source.substring(start, _index);
  }

  bool _match(String token) {
    _skipWhitespace();
    if (!source.startsWith(token, _index)) return false;
    _index += token.length;
    return true;
  }

  bool _peekIsLetter() {
    if (_index >= source.length) return false;
    final code = source.codeUnitAt(_index);
    return code >= 65 && code <= 90 || code >= 97 && code <= 122;
  }

  bool _isDigit(String char) {
    final code = char.codeUnitAt(0);
    return code >= 48 && code <= 57;
  }

  void _skipWhitespace() {
    while (_index < source.length && source[_index].trim().isEmpty) {
      _index++;
    }
  }
}
