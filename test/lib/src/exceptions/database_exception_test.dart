import 'package:iw_database/iw_database.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('DatabaseException', () {
    final String mockErrorMessage = 'Error';
    final String mockSqlCommand = 'SELECT * from dual';
    final Map<String, dynamic> mockSqlParameters = {'value': 1};
    final StackTrace mockStacktrace = StackTrace.fromString('StackTrace');

    group('Creation', () {
      test(
        'Should create the database exception without sqlCommand, sqlParameters and strackTrace.',
        () {
          // Act
          final DatabaseException exception = DatabaseException(
            errorMessage: mockErrorMessage,
          );

          // Asserts
          expect(exception.errorMessage, equals(mockErrorMessage));
        },
      );

      test(
        'Should create the database exception without sqlParameters and strackTrace.',
        () {
          // Act
          final DatabaseException exception = DatabaseException(
            errorMessage: mockErrorMessage,
            sqlCommand: mockSqlCommand,
          );

          // Asserts
          expect(exception.errorMessage, equals(mockErrorMessage));
          expect(exception.sqlCommand, equals(mockSqlCommand));
        },
      );

      test(
        'Should create the database exception without strackTrace.',
        () {
          // Act
          final DatabaseException exception = DatabaseException(
            errorMessage: mockErrorMessage,
            sqlCommand: mockSqlCommand,
            sqlParameters: mockSqlParameters,
          );

          // Asserts
          expect(exception.errorMessage, equals(mockErrorMessage));
          expect(exception.sqlCommand, equals(mockSqlCommand));
          expect(exception.sqlParameters, equals(mockSqlParameters));
        },
      );

      test(
        'Should create the database exception.',
        () {
          // Act
          final DatabaseException exception = DatabaseException(
            errorMessage: mockErrorMessage,
            sqlCommand: mockSqlCommand,
            sqlParameters: mockSqlParameters,
            stackTrace: mockStacktrace,
          );

          // Asserts
          expect(exception.errorMessage, equals(mockErrorMessage));
          expect(exception.sqlCommand, equals(mockSqlCommand));
          expect(exception.sqlParameters, equals(mockSqlParameters));
          expect(exception.stackTrace, equals(mockStacktrace));
        },
      );
    });

    group('Equals', () {
      test(
        'Should return TRUE when two database exceptions without sqlCommand, sqlParameters and strackTrace are equals.',
        () {
          // Arrange
          final DatabaseException exception1 = DatabaseException(
            errorMessage: mockErrorMessage,
          );

          final DatabaseException exception2 = DatabaseException(
            errorMessage: mockErrorMessage,
          );

          // Act/Asserts
          expect(exception1 == exception2, isTrue);
        },
      );

      test(
        'Should return TRUE when two database exceptions without sqlParameters and strackTrace are equals.',
        () {
          // Act
          final DatabaseException exception1 = DatabaseException(
            errorMessage: mockErrorMessage,
            sqlCommand: mockSqlCommand,
          );

          final DatabaseException exception2 = DatabaseException(
            errorMessage: mockErrorMessage,
            sqlCommand: mockSqlCommand,
          );

          // Act/Asserts
          expect(exception1 == exception2, isTrue);
        },
      );

      test(
        'Should return TRUE when two database exceptions without strackTrace are equals.',
        () {
          // Act
          final DatabaseException exception1 = DatabaseException(
            errorMessage: mockErrorMessage,
            sqlCommand: mockSqlCommand,
            sqlParameters: mockSqlParameters,
          );

          final DatabaseException exception2 = DatabaseException(
            errorMessage: mockErrorMessage,
            sqlCommand: mockSqlCommand,
            sqlParameters: mockSqlParameters,
          );

          // Act/Asserts
          expect(exception1 == exception2, isTrue);
        },
      );

      test(
        'Should return TRUE when two database exceptions are equals.',
        () {
          // Act
          final DatabaseException exception1 = DatabaseException(
            errorMessage: mockErrorMessage,
            sqlCommand: mockSqlCommand,
            sqlParameters: mockSqlParameters,
            stackTrace: mockStacktrace,
          );

          final DatabaseException exception2 = DatabaseException(
            errorMessage: mockErrorMessage,
            sqlCommand: mockSqlCommand,
            sqlParameters: mockSqlParameters,
            stackTrace: mockStacktrace,
          );

          // Act/Asserts
          expect(exception1 == exception2, isTrue);
        },
      );

      test(
        'Should return FALSE when two database exceptions without sqlCommand, sqlParameters and strackTrace are different.',
        () {
          // Arrange
          final DatabaseException exception1 = DatabaseException(
            errorMessage: mockErrorMessage,
          );

          final DatabaseException exception2 = DatabaseException(
            errorMessage: 'Error 2',
          );

          // Act/Asserts
          expect(exception1 == exception2, isFalse);
        },
      );

      test(
        'Should return FALSE when two database exceptions without sqlParameters and strackTrace are different.',
        () {
          // Act
          final DatabaseException exception1 = DatabaseException(
            errorMessage: mockErrorMessage,
            sqlCommand: mockSqlCommand,
          );

          final DatabaseException exception2 = DatabaseException(
            errorMessage: 'Error 2',
            sqlCommand: 'SELECT * FROM table',
          );

          // Act/Asserts
          expect(exception1 == exception2, isFalse);
        },
      );

      test(
        'Should return FALSE when two database exceptions without strackTrace are different.',
        () {
          // Act
          final DatabaseException exception1 = DatabaseException(
            errorMessage: mockErrorMessage,
            sqlCommand: mockSqlCommand,
            sqlParameters: mockSqlParameters,
          );

          final DatabaseException exception2 = DatabaseException(
            errorMessage: 'Error 2',
            sqlCommand: 'SELECT * FROM table',
            sqlParameters: {'value': 2},
          );

          // Act/Asserts
          expect(exception1 == exception2, isFalse);
        },
      );

      test(
        'Should return FALSE when two database exceptions are different.',
        () {
          // Act
          final DatabaseException exception1 = DatabaseException(
            errorMessage: mockErrorMessage,
            sqlCommand: mockSqlCommand,
            sqlParameters: mockSqlParameters,
            stackTrace: mockStacktrace,
          );

          final DatabaseException exception2 = DatabaseException(
            errorMessage: 'Error 2',
            sqlCommand: 'SELECT * FROM table',
            sqlParameters: {'value': 2},
            stackTrace: StackTrace.fromString('Another stacktrace'),
          );

          // Act/Asserts
          expect(exception1 == exception2, isFalse);
        },
      );
    });

    group('HashCode', () {
      test(
        'Should return TRUE when two database exceptions without sqlCommand, sqlParameters and strackTrace hashcodes are equals.',
        () {
          // Arrange
          final DatabaseException exception1 = DatabaseException(
            errorMessage: mockErrorMessage,
          );

          final DatabaseException exception2 = DatabaseException(
            errorMessage: mockErrorMessage,
          );

          // Act
          final int hashCodeException1 = exception1.hashCode;
          final int hashCodeException2 = exception2.hashCode;

          // Asserts
          expect(hashCodeException1 == hashCodeException2, isTrue);
        },
      );

      test(
        'Should return TRUE when two database exceptions without sqlParameters and strackTrace hashcodes are equals.',
        () {
          // Act
          final DatabaseException exception1 = DatabaseException(
            errorMessage: mockErrorMessage,
            sqlCommand: mockSqlCommand,
          );

          final DatabaseException exception2 = DatabaseException(
            errorMessage: mockErrorMessage,
            sqlCommand: mockSqlCommand,
          );

          // Act
          final int hashCodeException1 = exception1.hashCode;
          final int hashCodeException2 = exception2.hashCode;

          // Asserts
          expect(hashCodeException1 == hashCodeException2, isTrue);
        },
      );

      test(
        'Should return TRUE when two database exceptions without strackTrace hashcodes are equals.',
        () {
          // Act
          final DatabaseException exception1 = DatabaseException(
            errorMessage: mockErrorMessage,
            sqlCommand: mockSqlCommand,
            sqlParameters: mockSqlParameters,
          );

          final DatabaseException exception2 = DatabaseException(
            errorMessage: mockErrorMessage,
            sqlCommand: mockSqlCommand,
            sqlParameters: mockSqlParameters,
          );

          // Act
          final int hashCodeException1 = exception1.hashCode;
          final int hashCodeException2 = exception2.hashCode;

          // Asserts
          expect(hashCodeException1 == hashCodeException2, isTrue);
        },
      );

      test(
        'Should return TRUE when two database exceptions hashcodes are equals.',
        () {
          // Act
          final DatabaseException exception1 = DatabaseException(
            errorMessage: mockErrorMessage,
            sqlCommand: mockSqlCommand,
            sqlParameters: mockSqlParameters,
            stackTrace: mockStacktrace,
          );

          final DatabaseException exception2 = DatabaseException(
            errorMessage: mockErrorMessage,
            sqlCommand: mockSqlCommand,
            sqlParameters: mockSqlParameters,
            stackTrace: mockStacktrace,
          );

          // Act
          final int hashCodeException1 = exception1.hashCode;
          final int hashCodeException2 = exception2.hashCode;

          // Asserts
          expect(hashCodeException1 == hashCodeException2, isTrue);
        },
      );

      test(
        'Should return FALSE when two database exceptions without sqlCommand, sqlParameters and strackTrace hashcodes are different.',
        () {
          // Arrange
          final DatabaseException exception1 = DatabaseException(
            errorMessage: mockErrorMessage,
          );

          final DatabaseException exception2 = DatabaseException(
            errorMessage: 'Error 2',
          );

          // Act
          final int hashCodeException1 = exception1.hashCode;
          final int hashCodeException2 = exception2.hashCode;

          // Asserts
          expect(hashCodeException1 == hashCodeException2, isFalse);
        },
      );

      test(
        'Should return FALSE when two database exceptions without sqlParameters and strackTrace hashcodes are different.',
        () {
          // Act
          final DatabaseException exception1 = DatabaseException(
            errorMessage: mockErrorMessage,
            sqlCommand: mockSqlCommand,
          );

          final DatabaseException exception2 = DatabaseException(
            errorMessage: 'Error 2',
            sqlCommand: 'SELECT * FROM table',
          );

          // Act
          final int hashCodeException1 = exception1.hashCode;
          final int hashCodeException2 = exception2.hashCode;

          // Asserts
          expect(hashCodeException1 == hashCodeException2, isFalse);
        },
      );

      test(
        'Should return FALSE when two database exceptions without strackTrace hashcodes are different.',
        () {
          // Act
          final DatabaseException exception1 = DatabaseException(
            errorMessage: mockErrorMessage,
            sqlCommand: mockSqlCommand,
            sqlParameters: mockSqlParameters,
          );

          final DatabaseException exception2 = DatabaseException(
            errorMessage: 'Error 2',
            sqlCommand: 'SELECT * FROM table',
            sqlParameters: {'value': 2},
          );

          // Act
          final int hashCodeException1 = exception1.hashCode;
          final int hashCodeException2 = exception2.hashCode;

          // Asserts
          expect(hashCodeException1 == hashCodeException2, isFalse);
        },
      );

      test(
        'Should return FALSE when two database exceptions hashcodes are different.',
        () {
          // Act
          final DatabaseException exception1 = DatabaseException(
            errorMessage: mockErrorMessage,
            sqlCommand: mockSqlCommand,
            sqlParameters: mockSqlParameters,
            stackTrace: mockStacktrace,
          );

          final DatabaseException exception2 = DatabaseException(
            errorMessage: 'Error 2',
            sqlCommand: 'SELECT * FROM table',
            sqlParameters: {'value': 2},
            stackTrace: StackTrace.fromString('Another stacktrace'),
          );

          // Act
          final int hashCodeException1 = exception1.hashCode;
          final int hashCodeException2 = exception2.hashCode;

          // Asserts
          expect(hashCodeException1 == hashCodeException2, isFalse);
        },
      );
    });

    group('ToString', () {
      test(
        'Should create the database exception without sqlCommand, sqlParameters and strackTrace.',
        () {
          // Arrange
          final DatabaseException exception = DatabaseException(
            errorMessage: mockErrorMessage,
          );

          // Act
          final String toStringException = exception.toString();

          // Asserts
          expect(
            toStringException,
            equals(
              'DatabaseException(errorMessage: $mockErrorMessage, sqlCommand: null, sqlParameters: null, stackTrace: null)',
            ),
          );
        },
      );

      test(
        'Should create the database exception without sqlParameters and strackTrace.',
        () {
          // Arrange
          final DatabaseException exception = DatabaseException(
            errorMessage: mockErrorMessage,
            sqlCommand: mockSqlCommand,
          );

          // Act
          final String toStringException = exception.toString();

          // Asserts
          expect(
            toStringException,
            equals(
              'DatabaseException(errorMessage: $mockErrorMessage, sqlCommand: $mockSqlCommand, sqlParameters: null, stackTrace: null)',
            ),
          );
        },
      );

      test(
        'Should create the database exception without strackTrace.',
        () {
          // Arrange
          final DatabaseException exception = DatabaseException(
            errorMessage: mockErrorMessage,
            sqlCommand: mockSqlCommand,
            sqlParameters: mockSqlParameters,
          );

          // Act
          final String toStringException = exception.toString();

          // Asserts
          expect(
            toStringException,
            equals(
              'DatabaseException(errorMessage: $mockErrorMessage, sqlCommand: $mockSqlCommand, sqlParameters: $mockSqlParameters, stackTrace: null)',
            ),
          );
        },
      );

      test(
        'Should create the database exception.',
        () {
          // Arrange
          final DatabaseException exception = DatabaseException(
            errorMessage: mockErrorMessage,
            sqlCommand: mockSqlCommand,
            sqlParameters: mockSqlParameters,
            stackTrace: mockStacktrace,
          );

          // Act
          final String toStringException = exception.toString();

          // Asserts
          expect(
            toStringException,
            equals(
              'DatabaseException(errorMessage: $mockErrorMessage, sqlCommand: $mockSqlCommand, sqlParameters: $mockSqlParameters, stackTrace: $mockStacktrace)',
            ),
          );
        },
      );
    });
  });
}
