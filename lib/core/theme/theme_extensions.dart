import 'package:flutter/material.dart';

@immutable
class SubjectPalette {
  const SubjectPalette({
    required this.start,
    required this.end,
    required this.foreground,
    required this.shadow,
  });

  final Color start;
  final Color end;
  final Color foreground;
  final Color shadow;

  SubjectPalette copyWith({
    Color? start,
    Color? end,
    Color? foreground,
    Color? shadow,
  }) {
    return SubjectPalette(
      start: start ?? this.start,
      end: end ?? this.end,
      foreground: foreground ?? this.foreground,
      shadow: shadow ?? this.shadow,
    );
  }

  static SubjectPalette lerp(SubjectPalette a, SubjectPalette b, double t) {
    return SubjectPalette(
      start: Color.lerp(a.start, b.start, t)!,
      end: Color.lerp(a.end, b.end, t)!,
      foreground: Color.lerp(a.foreground, b.foreground, t)!,
      shadow: Color.lerp(a.shadow, b.shadow, t)!,
    );
  }
}

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
  final SubjectPalette mathematicsPalette;
  final SubjectPalette physicsPalette;
  final SubjectPalette chemistryPalette;
  final SubjectPalette biologyPalette;

  const AppCustomColors({
    required this.description,
    required this.cardBorder,
    required this.divider,
    required this.placeholder,
    required this.subjectCardBackground,
    required this.subjectCardBorder,
    required this.subjectCardTitle,
    required this.subjectCardDescription,
    required this.mathematicsPalette,
    required this.physicsPalette,
    required this.chemistryPalette,
    required this.biologyPalette,
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
    SubjectPalette? mathematicsPalette,
    SubjectPalette? physicsPalette,
    SubjectPalette? chemistryPalette,
    SubjectPalette? biologyPalette,
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
      mathematicsPalette: mathematicsPalette ?? this.mathematicsPalette,
      physicsPalette: physicsPalette ?? this.physicsPalette,
      chemistryPalette: chemistryPalette ?? this.chemistryPalette,
      biologyPalette: biologyPalette ?? this.biologyPalette,
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
      subjectCardBackground: Color.lerp(
        subjectCardBackground,
        other.subjectCardBackground,
        t,
      )!,
      subjectCardBorder: Color.lerp(
        subjectCardBorder,
        other.subjectCardBorder,
        t,
      )!,
      subjectCardTitle: Color.lerp(
        subjectCardTitle,
        other.subjectCardTitle,
        t,
      )!,
      subjectCardDescription: Color.lerp(
        subjectCardDescription,
        other.subjectCardDescription,
        t,
      )!,
      mathematicsPalette: SubjectPalette.lerp(
        mathematicsPalette,
        other.mathematicsPalette,
        t,
      ),
      physicsPalette: SubjectPalette.lerp(
        physicsPalette,
        other.physicsPalette,
        t,
      ),
      chemistryPalette: SubjectPalette.lerp(
        chemistryPalette,
        other.chemistryPalette,
        t,
      ),
      biologyPalette: SubjectPalette.lerp(
        biologyPalette,
        other.biologyPalette,
        t,
      ),
    );
  }
}
