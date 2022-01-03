import 'dart:developer' as developer;

class LoggerService {
  final String? prepend;

  const LoggerService({
    this.prepend,
  });

  void log(String message) {
    final buffer = StringBuffer();

    if (prepend != null && prepend!.isNotEmpty) {
      buffer.write('[$prepend]');
    }

    buffer.write(message);
    developer.log(buffer.toString());
  }
}
