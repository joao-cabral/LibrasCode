import 'package:flutter/material.dart';
import 'package:librascode/app/modules/core/factories/dialog/dialog_actions.dart';
import 'package:librascode/app/modules/core/factories/dialog/idialog.dart';

class AndroidDialog implements IDialog {
  @override
  Widget create(BuildContext context, Widget title, Widget content,
      List<DialogActions> actions) {
    return AlertDialog(
      title: title,
      content: content,
      actions: actions.map<Widget>((event) {
        return TextButton(
          child: event.child,
          onPressed: event.onPressed,
        );
      }).toList(),
    );
  }
}
