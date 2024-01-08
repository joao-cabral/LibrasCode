import 'package:flutter/material.dart';
import 'package:librascode/app/core/modules/libras_code_list_page.dart';
import 'package:provider/single_child_widget.dart';

abstract class LibrasCodeListModule {
  final Map<String, WidgetBuilder> _routers;
  final List<SingleChildWidget>? _bindings;

  LibrasCodeListModule({
    final List<SingleChildWidget>? bindings,
    required Map<String, WidgetBuilder> routers,
  })  : _routers = routers,
        _bindings = bindings;

  Map<String, WidgetBuilder> get routers {
    return _routers.map((key, pageBuilder) => MapEntry(key,
        (_) => LibrasCodeListPage(bindings: _bindings, page: pageBuilder)));
  }
}
