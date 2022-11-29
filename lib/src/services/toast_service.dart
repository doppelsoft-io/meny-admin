import 'package:doppelsoft_ui/doppelsoft_ui.dart';
import 'package:flutter/material.dart';

class ToastService {
  const ToastService();

  void init(DSToast dsToast) {
    dsToast.maybeMap(
      toast: (_) => toast(_.text),
      notification: (_) {
        showSimpleNotification(
          DSText(_.text, theme: _.toastThemeData.textThemeData),
          background: _.toastThemeData.backgroundColor,
          foreground: _.toastThemeData.foregroundColor,
          position: _.position,
        );
      },
      overlay: (_) {
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
                    style: _.toastThemeData.textThemeData.style,
                    child: Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Container(
                          color: _.toastThemeData.backgroundColor,
                          padding: const EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 48,
                          ),
                          child: _.content,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
      orElse: () {},
    );
  }
}
