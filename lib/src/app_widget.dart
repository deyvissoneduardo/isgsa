// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/database/sql_adm_connection.dart';
import 'core/navigator/todo_list_navigator.dart';
import 'core/theme/todo_list_ui_config.dart';
import 'modules/home/home_module.dart';
import 'modules/splash/splash_page.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    final sqliteconnection = SqlAdmConnection();

    @override
    void initState() {
      WidgetsBinding.instance.addObserver(sqliteconnection);
      super.initState();
    }

    @override
    void dispose() {
      WidgetsBinding.instance.removeObserver(sqliteconnection);
      super.dispose();
    }

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
