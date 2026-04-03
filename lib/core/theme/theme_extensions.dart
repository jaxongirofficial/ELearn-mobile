import 'package:flutter/material.dart';

@immutable
class AppCustomColors extends ThemeExtension<AppCustomColors> {
  final Color description; 
  final Color cardBorder;
  final Color divider; 
  final Color placeholder;

  const AppCustomColors({
    required this.description,
    required this.cardBorder,
    required this.divider,
    required this.placeholder,
  });

  @override
  AppCustomColors copyWith({
    Color? description,
    Color? cardBorder,
    Color? divider,
    Color? placeholder,
  }) {
    return AppCustomColors(
      description: description ?? this.description,
      cardBorder: cardBorder ?? this.cardBorder,
      divider: divider ?? this.divider,
      placeholder: placeholder ?? this.placeholder,
    );
  }

  @override
  AppCustomColors lerp(ThemeExtension<AppCustomColors>? other, double t) {
    if (other is! AppCustomColors) return this;
    return AppCustomColors(
      description: Color.lerp(description, other.description, t)!,
      cardBorder: Color.lerp(cardBorder, other.cardBorder, t)!,
      divider: Color.lerp(divider, other.divider, t)!,
      placeholder: Color.lerp(placeholder, other.placeholder, t)!,
    );
  }
}
