import 'dart:developer' as developer;

class LoggerService {
  const LoggerService({
    this.prepend,
  });

  final String? prepend;

  void log(String message) {
    final buffer = StringBuffer();

    if (prepend != null && prepend!.isNotEmpty) {
      buffer.write('[$prepend]');
    }

    buffer.write(message);
    developer.log(buffer.toString());
  }
}
