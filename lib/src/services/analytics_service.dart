import 'dart:developer' as developer;

import 'package:doppelsoft_core/doppelsoft_core.dart';

class AnalyticsService implements IAnalyticsService {
  const AnalyticsService();

  @override
  void track(DSEvent event) {
    final buffer = StringBuffer()
      ..write('[AnalyticsService](track): ')
      ..write(event.name);
    if (event.properties != null) {
      buffer
        ..write(' ')
        ..write(event.properties.toString());
    }
    developer.log(buffer.toString());
  }
}
