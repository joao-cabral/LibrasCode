import 'package:flutter/cupertino.dart';

import 'dialog_actions.dart';
import 'idialog.dart';

class IosDialog implements IDialog {
  @override
  Widget create(BuildContext context, Widget title, Widget content,
      List<DialogActions> actions) {
    return CupertinoAlertDialog(
      title: title,
      content: content,
      actions: actions.map<Widget>((event) {
        return CupertinoButton(
            child: event.child, onPressed: () => event.onPressed);
      }).toList(),
    );
  }
}
