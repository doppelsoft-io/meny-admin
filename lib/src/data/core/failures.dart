class Failure implements Exception {
  final int? code;
  final String message;
  final String shortMessage;

  Failure({
    this.code,
    required this.message,
    shortMessage,
  }) : shortMessage = message;
}
