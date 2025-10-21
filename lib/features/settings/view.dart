import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/utils/themes_util.dart';
import 'bloc.dart';
import 'event.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _isDark = false;
  String _currentTheme = ThemesUtil.defaultTheme;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _isDark = AdaptiveTheme.of(context).mode.isDark;
    _currentTheme = ThemesUtil.getThemeByColorByColorScheme(
      AdaptiveTheme.of(context).theme.colorScheme,
    );
    return BlocProvider<SettingsBloc>(
      create: (BuildContext context) => SettingsBloc()..add(InitEvent()),
      child: Builder(builder: (BuildContext context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    final SettingsBloc bloc = BlocProvider.of<SettingsBloc>(context);
    final ColorScheme theme = AdaptiveTheme.of(context).theme.colorScheme;
    final List<DropdownMenuItem<String>> themeItems = ThemesUtil.getThemes().map((String theme) {
      final ColorScheme scheme = ThemesUtil.getLightThemeColorScheme(theme);
      return DropdownMenuItem<String>(
        value: theme,
        child: Row(
          children: <Widget>[
            Container(width: 20, height: 20, color: scheme.primary),
            const SizedBox(width: 5),
            Text(ThemesUtil.getThemeName(theme)),
          ],
        ),
      );
    }).toList();
    return ColoredBox(
      color: theme.surface,
      child: Column(
        children: [
          const SizedBox(height: 100),
          // DART MODE
          Container(
            height: 60,
            decoration: BoxDecoration(color: theme.surfaceContainer),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('DarkMode', style: TextStyle(color: theme.inverseSurface, fontSize: 16)),
                  Switch(
                    value: _isDark,
                    onChanged: (bool value) {
                      setState(() {
                        _isDark = value;
                        if (_isDark) {
                          AdaptiveTheme.of(context).setDark();
                        } else {
                          AdaptiveTheme.of(context).setLight();
                        }
                      });
                    },
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 10),

          // CHOOSE THEMES
          Container(
            height: 60,
            decoration: BoxDecoration(color: theme.surfaceContainer),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('THEMES', style: TextStyle(color: theme.inverseSurface, fontSize: 16)),
                  DropdownButton<String>(
                    value: _currentTheme,
                    items: themeItems,
                    elevation: 16,
                    style: TextStyle(color: theme.inverseSurface),
                    underline: const SizedBox.shrink(),
                    onChanged: (String? newValue) {
                      if (newValue == null) {
                        return;
                      }
                      setState(() {
                        _currentTheme = newValue;
                      });
                      final ColorScheme scheme = ThemesUtil.getLightThemeColorScheme(newValue);
                      final ColorScheme darkScheme = ThemesUtil.getDarkThemeColorScheme(newValue);
                      AdaptiveTheme.of(context).setTheme(
                        light: ThemeData(colorScheme: scheme),
                        dark: ThemeData(colorScheme: darkScheme),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
