import 'dart:io';

import 'package:flutter/material.dart';
import 'package:librascode/app/modules/core/factories/dialog/android_dialog.dart';
import 'package:librascode/app/modules/core/factories/dialog/idialog.dart';
import 'package:librascode/app/modules/core/factories/dialog/ios_dialog.dart';

import 'dialog_actions.dart';

class DialogFactory {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static Future showAlertDialog(
      {required Widget title,
      required Widget content,
      required List<DialogActions> actions}) {
    IDialog dialogData;

    if (Platform.isIOS) {
      dialogData = IosDialog();
    } else {
      dialogData = AndroidDialog();
    }

    return showDialog(
      context: navigatorKey.currentState!.overlay!.context,
      builder: (context) => dialogData.create(
        context,
        title,
        content,
        actions,
      ),
    );
  }
}
