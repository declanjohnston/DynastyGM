import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'utils/app_state_notifier.dart';
import 'config/theme_data.dart';
import 'routes/index.dart';

class App extends StatelessWidget {
  Widget build(BuildContext context) {
    return Consumer<AppStateNotifier>(builder: (context, appState, child) {
      return MaterialApp(
        title: 'News!',
        theme: ThemeConfig.lightTheme,
        darkTheme: ThemeConfig.darkTheme,
        themeMode: appState.isDarkMode ? ThemeMode.dark : ThemeMode.light,
        onGenerateRoute: routes,
      );
    });
  }
}
