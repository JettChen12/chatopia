import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

import '../common/themes/default_theme.dart';
import '../features/chat/view.dart';
import '../features/home/view.dart';
import '../features/settings/view.dart';

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final List<Widget> _pages = <Widget>[const HomePage(), const ChatPage(), const SettingsPage()];

  int _pageIndex = 1;

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData(colorScheme: DefaultTheme.lightScheme()),
      dark: ThemeData(colorScheme: DefaultTheme.darkScheme()),
      initial: AdaptiveThemeMode.system,
      builder: (ThemeData lightTheme, ThemeData darkTheme) {
        return MaterialApp(
          theme: lightTheme,
          darkTheme: darkTheme,
          home: Builder(builder: (BuildContext context){
            final ColorScheme theme = AdaptiveTheme.of(context).theme.colorScheme;
            return Scaffold(
              bottomNavigationBar: ConvexAppBar(
                initialActiveIndex: _pageIndex,
                color: theme.surface,
                activeColor: theme.surface,
                backgroundColor: theme.primary,
                items: const <TabItem<IconData>>[
                  TabItem<IconData>(icon: Icons.home),
                  TabItem<IconData>(icon: Icons.chat_bubble_outline),
                  TabItem<IconData>(icon: Icons.people),
                ],
                onTap: (int i) {
                  setState(() {
                    _pageIndex = i;
                  });
                },
              ),
              body: _pages[_pageIndex],
            );
          }),
        );
      },
    );
  }
}
