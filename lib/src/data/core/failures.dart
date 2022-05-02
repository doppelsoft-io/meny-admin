class Failure implements Exception {
  const Failure({
    this.code,
    required this.message,
    this.shortMessage,
  });

  final int? code;
  final String message;
  final String? shortMessage;

  @override
  String toString() => message;
}
