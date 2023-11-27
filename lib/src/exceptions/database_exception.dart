import 'package:collection/collection.dart';

final class DatabaseException implements Exception {
  final String errorMessage;
  final String? sqlCommand;
  final Map<String, dynamic>? sqlParameters;
  final StackTrace? stackTrace;

  const DatabaseException({
    required this.errorMessage,
    this.sqlCommand,
    this.sqlParameters,
    this.stackTrace,
  });

  @override
  bool operator ==(covariant DatabaseException other) {
    if (identical(this, other)) {
      return true;
    }

    final listEquals = const DeepCollectionEquality().equals;

    return other.errorMessage == errorMessage &&
        other.sqlCommand == sqlCommand &&
        listEquals(other.sqlParameters, sqlParameters) &&
        other.stackTrace == stackTrace;
  }

  @override
  int get hashCode {
    return errorMessage.hashCode ^
        sqlCommand.hashCode ^
        sqlParameters.hashCode ^
        stackTrace.hashCode;
  }

  @override
  String toString() {
    return 'DatabaseException(errorMessage: $errorMessage, sqlCommand: $sqlCommand, sqlParameters: $sqlParameters, stackTrace: $stackTrace)';
  }
}
