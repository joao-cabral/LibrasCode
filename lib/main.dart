import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:librascode/app/app_widget.dart';

import 'app/app_module.dart';

void main() async {
  await initializeDateFormatting('pt_BR', null);

  runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}
