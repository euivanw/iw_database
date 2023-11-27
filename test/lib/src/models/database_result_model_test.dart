import 'package:iw_database/iw_database.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('DatabaseResult', () {
    final int mockDatabaseRows = 1;
    final List<Map<String, dynamic>> mockDatabaseResults = [
      {
        'id': 1,
        'name': 'Maria',
      },
      {
        'id': 2,
        'name': 'João',
      },
    ];

    group('Creation', () {
      test(
        'Should create the database result.',
        () {
          // Act
          final DatabaseResult result = DatabaseResult(
            rows: mockDatabaseRows,
            results: mockDatabaseResults,
          );

          // Asserts
          expect(result.rows, equals(mockDatabaseRows));
          expect(result.results, equals(mockDatabaseResults));
        },
      );
    });

    group('Equals', () {
      test(
        'Should return TRUE when two database results are equals.',
        () {
          // Arrange
          final DatabaseResult result1 = DatabaseResult(
            rows: mockDatabaseRows,
            results: mockDatabaseResults,
          );

          final DatabaseResult result2 = DatabaseResult(
            rows: mockDatabaseRows,
            results: mockDatabaseResults,
          );

          // Act/Asserts
          expect(result1 == result2, isTrue);
        },
      );

      test(
        'Should return FALSE when two database result are different.',
        () {
          // Arrange
          final DatabaseResult result1 = DatabaseResult(
            rows: mockDatabaseRows,
            results: mockDatabaseResults,
          );

          final DatabaseResult result2 = DatabaseResult(
            rows: 2,
            results: [
              {
                'id': 1,
              },
            ],
          );

          // Act/Asserts
          expect(result1 == result2, isFalse);
        },
      );
    });

    group('HashCode', () {
      test(
        'Should return TRUE when two database result hashcode are equals.',
        () {
          // Arrange
          final DatabaseResult result1 = DatabaseResult(
            rows: mockDatabaseRows,
            results: mockDatabaseResults,
          );

          final DatabaseResult result2 = DatabaseResult(
            rows: mockDatabaseRows,
            results: mockDatabaseResults,
          );

          // Act
          final int resultHashCode1 = result1.hashCode;
          final int resultHashCode2 = result2.hashCode;

          // Asserts
          expect(resultHashCode1 == resultHashCode2, isTrue);
        },
      );

      test(
        'Should return FALSE when two database result are different.',
        () {
          // Arrange
          final DatabaseResult result1 = DatabaseResult(
            rows: mockDatabaseRows,
            results: mockDatabaseResults,
          );

          final DatabaseResult result2 = DatabaseResult(
            rows: 2,
            results: [
              {
                'id': 1,
              },
            ],
          );

          // Act
          final int resultHashCode1 = result1.hashCode;
          final int resultHashCode2 = result2.hashCode;

          // Asserts
          expect(resultHashCode1 == resultHashCode2, isFalse);
        },
      );
    });

    group('ToString', () {
      test(
        'Should return the string representation of the object when toString method is called.',
        () {
          // Arrange
          final DatabaseResult result = DatabaseResult(
            rows: mockDatabaseRows,
            results: mockDatabaseResults,
          );

          // Act
          final String toStringResult = result.toString();

          // Asserts
          expect(
            toStringResult,
            equals(
              'DatabaseResult(rows: $mockDatabaseRows, results: $mockDatabaseResults)',
            ),
          );
        },
      );
    });
  });
}
