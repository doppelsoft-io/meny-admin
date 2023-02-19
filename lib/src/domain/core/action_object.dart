import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:flutter/material.dart';
import 'package:meny_admin/locator.dart';

class ActionObject {
  ActionObject(
    VoidCallback callback, {
    required DSEvent event,
    IAnalyticsService? analyticsService,
  })  : _callback = callback,
        _event = event,
        _analyticsService = analyticsService ?? Locator.instance() {
    _callback();
    _analyticsService.track(_event);
  }

  final IAnalyticsService _analyticsService;
  final VoidCallback _callback;
  final DSEvent _event;
}
