import 'package:flutter/material.dart';
import 'package:librascode/app/modules/core/database/sqlite_connection_factory.dart';

class SqliteAdmConnection with WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final connection = SqliteConnectionFactory();

    switch (state) {
      case AppLifecycleState.resumed:
        break;
      case AppLifecycleState.inactive:
      case AppLifecycleState.paused:
      case AppLifecycleState.detached:
        connection.closeConnection();
        break;
      default:
    }

    super.didChangeAppLifecycleState(state);
  }
}
