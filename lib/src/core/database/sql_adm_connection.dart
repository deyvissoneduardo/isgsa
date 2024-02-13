import 'package:flutter/cupertino.dart';

import 'sqlite_connection_factory.dart';

class SqlAdmConnection with WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final connection = SqliteConnectionFactory();
    switch (state) {
      case AppLifecycleState.resumed:
      case AppLifecycleState.hidden:
        break;
      case AppLifecycleState.inactive:
      case AppLifecycleState.paused:
      case AppLifecycleState.detached:
        connection.closeConnection();
        break;
    }
    super.didChangeAppLifecycleState(state);
  }
}
