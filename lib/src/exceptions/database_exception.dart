class DatabaseException implements Exception {
  final String errorMessage;
  final StackTrace? stackTrace;

  const DatabaseException({
    required this.errorMessage,
    this.stackTrace,
  });
}
