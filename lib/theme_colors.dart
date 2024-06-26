import 'package:flutter/material.dart';

class SmoothColorsThemeExtension
    extends ThemeExtension<SmoothColorsThemeExtension> {
  SmoothColorsThemeExtension({
    required this.primaryBlack,
    required this.primaryDark,
    required this.primarySemiDark,
    required this.primaryNormal,
    required this.primaryMedium,
    required this.primaryLight,
    required this.secondaryNormal,
    required this.secondaryLight,
    required this.green,
    required this.orange,
    required this.red,
    required this.grayDark,
    required this.grayLight,
  });

  SmoothColorsThemeExtension.defaultValue()
      : primaryBlack = const Color(0xFF341100),
        primaryDark = const Color(0xFF483527),
        primarySemiDark = const Color(0xFF52443D),
        primaryNormal = const Color(0xFFA08D84),
        primaryMedium = const Color(0xFFEDE0DB),
        primaryLight = const Color(0xFFF6F3F0),
        secondaryNormal = const Color(0xFFF2994A),
        secondaryLight = const Color(0xFFEE8858),
        green = const Color(0xFF219653),
        orange = const Color(0xFFFB8229),
        red = const Color(0xFFEB5757),
        grayDark = const Color(0xFF666666),
        grayLight = const Color(0xFF8F8F8F);

  final Color primaryBlack;
  final Color primaryDark;
  final Color primarySemiDark;
  final Color primaryNormal;
  final Color primaryMedium;
  final Color primaryLight;
  final Color secondaryNormal;
  final Color secondaryLight;
  final Color green;
  final Color orange;
  final Color red;
  final Color grayDark;
  final Color grayLight;

  @override
  ThemeExtension<SmoothColorsThemeExtension> copyWith({
    Color? primaryBlack,
    Color? primaryExtraDark,
    Color? primaryDark,
    Color? primaryNormal,
    Color? primaryLight,
    Color? primaryVeryLight,
    Color? secondaryNormal,
    Color? secondaryLight,
    Color? green,
    Color? orange,
    Color? red,
    Color? grayDark,
    Color? grayLight,
  }) {
    return SmoothColorsThemeExtension(
      primaryBlack: primaryBlack ?? this.primaryBlack,
      primaryDark: primaryExtraDark ?? this.primaryDark,
      primarySemiDark: primaryDark ?? this.primarySemiDark,
      primaryNormal: primaryNormal ?? this.primaryNormal,
      primaryMedium: primaryLight ?? this.primaryMedium,
      primaryLight: primaryVeryLight ?? this.primaryLight,
      secondaryNormal: secondaryNormal ?? this.secondaryNormal,
      secondaryLight: secondaryLight ?? this.secondaryLight,
      green: green ?? this.green,
      orange: orange ?? this.orange,
      red: red ?? this.red,
      grayDark: grayDark ?? this.grayDark,
      grayLight: grayLight ?? this.grayLight,
    );
  }

  @override
  ThemeExtension<SmoothColorsThemeExtension> lerp(
    covariant ThemeExtension<SmoothColorsThemeExtension>? other,
    double t,
  ) {
    if (other is! SmoothColorsThemeExtension) {
      return this;
    }

    return SmoothColorsThemeExtension(
      primaryBlack: Color.lerp(
        primaryBlack,
        other.primaryBlack,
        t,
      )!,
      primaryDark: Color.lerp(
        primaryDark,
        other.primaryDark,
        t,
      )!,
      primarySemiDark: Color.lerp(
        primarySemiDark,
        other.primarySemiDark,
        t,
      )!,
      primaryNormal: Color.lerp(
        primaryNormal,
        other.primaryNormal,
        t,
      )!,
      primaryMedium: Color.lerp(
        primaryMedium,
        other.primaryMedium,
        t,
      )!,
      primaryLight: Color.lerp(
        primaryLight,
        other.primaryLight,
        t,
      )!,
      secondaryNormal: Color.lerp(
        secondaryNormal,
        other.secondaryNormal,
        t,
      )!,
      secondaryLight: Color.lerp(
        secondaryLight,
        other.secondaryLight,
        t,
      )!,
      green: Color.lerp(
        green,
        other.green,
        t,
      )!,
      orange: Color.lerp(
        orange,
        other.orange,
        t,
      )!,
      red: Color.lerp(
        red,
        other.red,
        t,
      )!,
      grayDark: Color.lerp(
        grayDark,
        other.grayDark,
        t,
      )!,
      grayLight: Color.lerp(
        grayLight,
        other.grayLight,
        t,
      )!,
    );
  }
}
