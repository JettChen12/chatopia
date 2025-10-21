import 'package:flutter/material.dart';

import '../themes/autumn_theme.dart';
import '../themes/default_theme.dart';
import '../themes/forest_theme.dart';
import '../themes/sunset_theme.dart';

class ThemesUtil {
  static const String defaultTheme = 'default';
  static const String autumnTheme = 'autumn';
  static const String forestTheme = 'forest';
  static const String sunsetTheme = 'sunset';

  static List<String> getThemes() {
    return <String>[defaultTheme, autumnTheme, forestTheme, sunsetTheme];
  }

  static String getThemeByColorByColorScheme(ColorScheme? colorScheme) {
    if (colorScheme == null) {
      return defaultTheme;
    }
    if (colorScheme == DefaultTheme.lightScheme() || colorScheme == DefaultTheme.darkScheme()) {
      return defaultTheme;
    }
    if (colorScheme == AutumnTheme.lightScheme() || colorScheme == AutumnTheme.darkScheme()) {
      return autumnTheme;
    }
    if (colorScheme == ForestTheme.lightScheme() || colorScheme == ForestTheme.darkScheme()) {
      return forestTheme;
    }
    if (colorScheme == SunsetTheme.lightScheme() || colorScheme == SunsetTheme.darkScheme()) {
      return sunsetTheme;
    }
    return defaultTheme;
  }

  static String getThemeName(String theme) {
    switch (theme) {
      case defaultTheme:
        return 'Default';
      case autumnTheme:
        return 'Autumn';
      case forestTheme:
        return 'Forest';
      case sunsetTheme:
        return 'Sunset';
      default:
        return 'Default';
    }
  }

  /// 获取亮色主题
  static ColorScheme getLightThemeColorScheme(String theme) {
    switch (theme) {
      case defaultTheme:
        return DefaultTheme.lightScheme();
      case autumnTheme:
        return AutumnTheme.lightScheme();
      case forestTheme:
        return ForestTheme.lightScheme();
      case sunsetTheme:
        return SunsetTheme.lightScheme();
      default:
        return DefaultTheme.lightScheme();
    }
  }

  /// 获取暗色主题
  static ColorScheme getDarkThemeColorScheme(String theme) {
    switch (theme) {
      case defaultTheme:
        return DefaultTheme.darkScheme();
      case autumnTheme:
        return AutumnTheme.darkScheme();
      case forestTheme:
        return ForestTheme.darkScheme();
      case sunsetTheme:
        return SunsetTheme.darkScheme();
      default:
        return DefaultTheme.darkScheme();
    }
  }
}
