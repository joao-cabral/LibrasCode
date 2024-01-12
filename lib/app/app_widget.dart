import 'package:flutter/material.dart';
import 'package:librascode/app/core/database/sqlite_adm_connection.dart';
import 'package:librascode/app/modules/history/history_module.dart';
import 'package:librascode/app/modules/scan/home/home_page.dart';
import 'package:librascode/app/modules/scan/scan_module.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  final sqliteAdmConnection = SqliteAdmConnection();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(sqliteAdmConnection);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(sqliteAdmConnection);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LibrasCode',
      routes: {...ScanModule().routers, ...HistoryModule().routers},
      home: const HomePage(),
    );
  }
}
