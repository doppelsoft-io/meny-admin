import 'package:flutter/material.dart';
import 'package:meny_admin/themes.dart';
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
    lib.showOverlay(
      (context, progress) {
        return Transform.translate(
          offset: Tween<Offset>(
            begin: const Offset(0, 40),
            end: Offset.zero,
          ).transform(progress),
          child: Opacity(
            opacity: Tween<double>(
              begin: 0,
              end: 1,
            ).transform(progress),
            child: SafeArea(
              child: DefaultTextStyle(
                style: Themes.textStyle.copyWith(color: colorScheme.onPrimary),
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Container(
                      color: type == ToastType.error
                          ? colorScheme.error
                          : colorScheme.primary,
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 48,
                      ),
                      child: notification,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
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
