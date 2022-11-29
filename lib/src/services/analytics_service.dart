import 'dart:developer' as developer;

class AnalyticsService {
  const AnalyticsService();

  void track({
    required String message,
    Map<String, String>? params,
  }) {
    final buffer = StringBuffer()
      ..write('[AnalyticsService](track): ')
      ..write(message);
    if (params != null) {
      buffer
        ..write(' ')
        ..write(params.toString());
    }
    developer.log(buffer.toString());
  }
}
