import 'package:flutter/material.dart';

import 'dialog_actions.dart';

abstract class IDialog {
  Widget create(BuildContext context, Widget title, Widget content,
      List<DialogActions> actions);
}
