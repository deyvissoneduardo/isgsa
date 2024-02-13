import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/navigator/todo_list_navigator.dart';
import 'core/theme/todo_list_ui_config.dart';
import 'modules/home/home_module.dart';
import 'modules/splash/splash_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TODO App',
      theme: TodoListUiConfig.theme,
      navigatorKey: TodoListNavigator.navigatorKey,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('pt', 'BR'),
      ],
      routes: {
        ...HomeModule().routers,
      },
      home: const SplashPage(),
    );
  }
}
