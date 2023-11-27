import 'package:iw_database/iw_database.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('DatabaseProperties', () {
    final String mockDatabaseHost = 'localhost';
    final int mockDatabasePort = 3306;
    final String mockDatabaseName = 'database';
    final String mockDatabaseUsername = 'root';
    final String mockDatabasePassword = 'root';

    group('Creation', () {
      test(
        'Should create the database properties.',
        () {
          // Act
          final DatabaseProperties property = DatabaseProperties(
            host: mockDatabaseHost,
            port: mockDatabasePort,
            name: mockDatabaseName,
            username: mockDatabaseUsername,
            password: mockDatabasePassword,
          );

          // Asserts
          expect(property.host, equals(mockDatabaseHost));
          expect(property.port, equals(mockDatabasePort));
          expect(property.name, equals(mockDatabaseName));
          expect(property.username, equals(mockDatabaseUsername));
          expect(property.password, equals(mockDatabasePassword));
        },
      );
    });

    group('Equals', () {
      test(
        'Should return TRUE when two database properties are equals.',
        () {
          // Arrange
          final DatabaseProperties property1 = DatabaseProperties(
            host: mockDatabaseHost,
            port: mockDatabasePort,
            name: mockDatabaseName,
            username: mockDatabaseUsername,
            password: mockDatabasePassword,
          );

          final DatabaseProperties property2 = DatabaseProperties(
            host: mockDatabaseHost,
            port: mockDatabasePort,
            name: mockDatabaseName,
            username: mockDatabaseUsername,
            password: mockDatabasePassword,
          );

          // Act/Asserts
          expect(property1 == property2, isTrue);
        },
      );

      test(
        'Should return FALSE when two database properties are different.',
        () {
          // Arrange
          final DatabaseProperties property1 = DatabaseProperties(
            host: mockDatabaseHost,
            port: mockDatabasePort,
            name: mockDatabaseName,
            username: mockDatabaseUsername,
            password: mockDatabasePassword,
          );

          final DatabaseProperties property2 = DatabaseProperties(
            host: mockDatabaseHost,
            port: 5432,
            name: mockDatabaseName,
            username: mockDatabaseUsername,
            password: 'password',
          );

          // Act/Asserts
          expect(property1 == property2, isFalse);
        },
      );
    });

    group('HashCode', () {
      test(
        'Should return TRUE when two database properties hashcode are equals.',
        () {
          // Arrange
          final DatabaseProperties property1 = DatabaseProperties(
            host: mockDatabaseHost,
            port: mockDatabasePort,
            name: mockDatabaseName,
            username: mockDatabaseUsername,
            password: mockDatabasePassword,
          );

          final DatabaseProperties property2 = DatabaseProperties(
            host: mockDatabaseHost,
            port: mockDatabasePort,
            name: mockDatabaseName,
            username: mockDatabaseUsername,
            password: mockDatabasePassword,
          );

          // Act
          final int propertyHashCode1 = property1.hashCode;
          final int propertyHashCode2 = property2.hashCode;

          // Asserts
          expect(propertyHashCode1 == propertyHashCode2, isTrue);
        },
      );

      test(
        'Should return FALSE when two database properties are different.',
        () {
          // Arrange
          final DatabaseProperties property1 = DatabaseProperties(
            host: mockDatabaseHost,
            port: mockDatabasePort,
            name: mockDatabaseName,
            username: mockDatabaseUsername,
            password: mockDatabasePassword,
          );

          final DatabaseProperties property2 = DatabaseProperties(
            host: mockDatabaseHost,
            port: 5432,
            name: mockDatabaseName,
            username: mockDatabaseUsername,
            password: 'password',
          );

          // Act
          final int propertyHashCode1 = property1.hashCode;
          final int propertyHashCode2 = property2.hashCode;

          // Asserts
          expect(propertyHashCode1 == propertyHashCode2, isFalse);
        },
      );
    });

    group('ToString', () {
      test(
        'Should return the string representation of the object when toString method is called.',
        () {
          // Arrange
          final DatabaseProperties property = DatabaseProperties(
            host: mockDatabaseHost,
            port: mockDatabasePort,
            name: mockDatabaseName,
            username: mockDatabaseUsername,
            password: mockDatabasePassword,
          );

          // Act
          final String toStringProperty = property.toString();

          // Asserts
          expect(
            toStringProperty,
            equals(
              'DatabaseProperties(host: $mockDatabaseHost, port: $mockDatabasePort, name: $mockDatabaseName, username: $mockDatabaseUsername, password: $mockDatabasePassword)',
            ),
          );
        },
      );
    });
  });
}
