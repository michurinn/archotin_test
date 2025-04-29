import 'package:archonit_test/shared/extensions/theme_extensions/theme_text_styles.dart';
import 'package:flutter/material.dart';

// Extension для получения ThemeExtension текущей темы
extension BuildContextThemeTextStylesExtension on BuildContext {
  // Получить используемые  ThemeTextStyles в теме ThemeExtension
  ThemeTextStyles get themeTextStyle =>
      Theme.of(this).extension<ThemeTextStyles>()!;
}
