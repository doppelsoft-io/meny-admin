import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart' as lib;

enum ToastType {
  info,
  error,
}

class ToastService {
  ToastService({required this.colorScheme});

  final ColorScheme colorScheme;

  void toast(String message) {
    lib.toast(message);
  }

  void showOverlay(
    Widget notification, [
    ToastType? type = ToastType.info,
  ]) {
    lib.showSimpleNotification(
      notification,
      background:
          type == ToastType.error ? colorScheme.error : colorScheme.primary,
      foreground:
          type == ToastType.error ? colorScheme.onError : colorScheme.onPrimary,
      position: lib.NotificationPosition.bottom,
    );
  }

  void showNotification(
    Widget notification, [
    ToastType? type = ToastType.info,
  ]) {
    final backgroundColor =
        type == ToastType.error ? colorScheme.error : colorScheme.primary;

    final foregroundColor =
        type == ToastType.error ? colorScheme.onError : colorScheme.onPrimary;

    lib.showSimpleNotification(
      notification,
      background: backgroundColor,
      foreground: foregroundColor,

      // position: lib.NotificationPosition.bottom,
    );
  }
}
