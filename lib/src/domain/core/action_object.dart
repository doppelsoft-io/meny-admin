import 'package:flutter/material.dart';
import 'package:meny_admin/locator.dart';
import 'package:meny_admin/src/services/analytics_service.dart';

class ActionObject {
  ActionObject({
    AnalyticsService? analyticsService,
    required String eventName,
    required VoidCallback callback,
    Map<String, String>? params,
  })  : _analyticsService = analyticsService ?? Locator.instance(),
        _eventName = eventName,
        _callback = callback,
        _params = params;

  final AnalyticsService _analyticsService;
  final String _eventName;
  final VoidCallback _callback;
  final Map<String, String>? _params;

  void call() {
    _callback();
    _analyticsService.track(message: _eventName, params: _params);
  }
}
