import 'package:doppelsoft_ui/doppelsoft_ui.dart'
    show
        DSTextThemeData,
        NotificationPosition,
        showOverlay,
        showSimpleNotification,
        toast;
import 'package:flutter/material.dart';

enum ToastType {
  info,
  error,
}

class ToastService {
  ToastService({required this.colorScheme});

  final ColorScheme colorScheme;

  void initToast(String message) {
    toast(message);
  }

  void initOverlay(
    Widget notification, [
    ToastType? type = ToastType.info,
  ]) {
    showOverlay(
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
                style: DSTextThemeData.b5(
                  color: colorScheme.onPrimary,
                ).style,
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

    showSimpleNotification(
      notification,
      background: backgroundColor,
      foreground: foregroundColor,
      position: NotificationPosition.bottom,
    );
  }
}
