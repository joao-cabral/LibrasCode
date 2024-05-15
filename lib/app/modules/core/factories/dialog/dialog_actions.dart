import 'package:flutter/material.dart';

class DialogActions<T> {
  T child;
  VoidCallback? onPressed;

  DialogActions({
    required this.child,
    required this.onPressed,
  });
}
