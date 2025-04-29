import 'package:archonit_test/src/app/constatnts/app_colors.dart';
import 'package:flutter/material.dart';

class ThemeTextStyles extends ThemeExtension<ThemeTextStyles> {
  final TextStyle title;

  ThemeTextStyles({required this.title});
  
  ThemeTextStyles.light()
      : title = const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 17.0,
          height: 24.0 / 17.0,
          letterSpacing: -0.41,
          color: AppColors.uiBlack,
        );

  @override
  ThemeExtension<ThemeTextStyles> copyWith({TextStyle? title}) {
    return ThemeTextStyles(title: title ?? this.title);
  }

  @override
  ThemeExtension<ThemeTextStyles> lerp(
    covariant ThemeExtension<ThemeTextStyles>? other,
    double t,
  ) {
    if (other is! ThemeTextStyles) {
      return this;
    } else {
      return ThemeTextStyles(
        title: TextStyle.lerp(title, other.title, t)!,
      );
    }
  }
}
