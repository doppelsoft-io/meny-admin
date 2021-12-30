import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart' as lib;

enum ToastType {
  info,
  error,
}

class ToastService {
  const ToastService._();

  static void toast(String message) {
    lib.toast(message);
  }

  static void showNotification(
    Widget notification, [
    ToastType? type = ToastType.info,
  ]) {
    lib.showSimpleNotification(
      notification,
      background: type == ToastType.error ? Colors.red : Colors.black,
      position: lib.NotificationPosition.bottom,
    );
  }
}
