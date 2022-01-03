import 'dart:developer' as developer;

class AnalyticsService {
  const AnalyticsService._();

  static void track({
    required String message,
    Map<String, String>? params,
  }) {
    final buffer = StringBuffer();
    buffer.write('[AnalyticsService](track): ');
    buffer.write(message);
    if (params != null) {
      buffer.write(' ');
      buffer.write(params.toString());
    }
    developer.log(buffer.toString());
  }
}
