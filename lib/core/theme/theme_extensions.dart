import 'package:flutter/material.dart';

@immutable
class AppCustomColors extends ThemeExtension<AppCustomColors> {
  final Color description; 
  final Color cardBorder;
  final Color divider; 
  final Color placeholder;
  final Color subjectCardBackground;
  final Color subjectCardBorder;
  final Color subjectCardTitle;
  final Color subjectCardDescription;
  final Color subjectCardIconStart;
  final Color subjectCardIconEnd;
  final Color subjectCardIconForeground;

  const AppCustomColors({
    required this.description,
    required this.cardBorder,
    required this.divider,
    required this.placeholder,
    required this.subjectCardBackground,
    required this.subjectCardBorder,
    required this.subjectCardTitle,
    required this.subjectCardDescription,
    required this.subjectCardIconStart,
    required this.subjectCardIconEnd,
    required this.subjectCardIconForeground,
  });

  @override
  AppCustomColors copyWith({
    Color? description,
    Color? cardBorder,
    Color? divider,
    Color? placeholder,
    Color? subjectCardBackground,
    Color? subjectCardBorder,
    Color? subjectCardTitle,
    Color? subjectCardDescription,
    Color? subjectCardIconStart,
    Color? subjectCardIconEnd,
    Color? subjectCardIconForeground,
  }) {
    return AppCustomColors(
      description: description ?? this.description,
      cardBorder: cardBorder ?? this.cardBorder,
      divider: divider ?? this.divider,
      placeholder: placeholder ?? this.placeholder,
      subjectCardBackground:
          subjectCardBackground ?? this.subjectCardBackground,
      subjectCardBorder: subjectCardBorder ?? this.subjectCardBorder,
      subjectCardTitle: subjectCardTitle ?? this.subjectCardTitle,
      subjectCardDescription:
          subjectCardDescription ?? this.subjectCardDescription,
      subjectCardIconStart: subjectCardIconStart ?? this.subjectCardIconStart,
      subjectCardIconEnd: subjectCardIconEnd ?? this.subjectCardIconEnd,
      subjectCardIconForeground:
          subjectCardIconForeground ?? this.subjectCardIconForeground,
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
      subjectCardBackground:
          Color.lerp(subjectCardBackground, other.subjectCardBackground, t)!,
      subjectCardBorder:
          Color.lerp(subjectCardBorder, other.subjectCardBorder, t)!,
      subjectCardTitle:
          Color.lerp(subjectCardTitle, other.subjectCardTitle, t)!,
      subjectCardDescription:
          Color.lerp(subjectCardDescription, other.subjectCardDescription, t)!,
      subjectCardIconStart:
          Color.lerp(subjectCardIconStart, other.subjectCardIconStart, t)!,
      subjectCardIconEnd:
          Color.lerp(subjectCardIconEnd, other.subjectCardIconEnd, t)!,
      subjectCardIconForeground: Color.lerp(
        subjectCardIconForeground,
        other.subjectCardIconForeground,
        t,
      )!,
    );
  }
}
