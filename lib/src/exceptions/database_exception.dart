import 'package:collection/collection.dart';

/// This class represents an exception thrown by the encapsulated database client.
final class DatabaseException implements Exception {
  /// Error message emited by the supported database client.
  final String errorMessage;

  /// SQL command used by the query.
  final String? sqlCommand;

  /// SQL parameters used by the query.
  final Map<String, dynamic>? sqlParameters;

  /// The stacktrace generated by the exception.
  final StackTrace? stackTrace;

  /// Constructor
  const DatabaseException({
    required this.errorMessage,
    this.sqlCommand,
    this.sqlParameters,
    this.stackTrace,
  });

  /// DatabaseException equals method.
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

  /// DatabaseException hash code getter.
  @override
  int get hashCode {
    return errorMessage.hashCode ^
        sqlCommand.hashCode ^
        sqlParameters.hashCode ^
        stackTrace.hashCode;
  }

  /// DatabaseException toString method.
  @override
  String toString() {
    return 'DatabaseException(errorMessage: $errorMessage, sqlCommand: $sqlCommand, sqlParameters: $sqlParameters, stackTrace: $stackTrace)';
  }
}
