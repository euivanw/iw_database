import 'package:mysql_client/exception.dart';
import 'package:mysql_client/mysql_client.dart';

import '../exceptions/database_exception.dart';
import '../models/database_properties_model.dart';
import '../models/database_result_model.dart';
import 'database_client_service.dart';

/// This class implements the `mysql_client` and encapsulates to a
/// `DatabaseClientService`.
///
/// You can instantiate this classe to execute database queries using
/// `mysql_client`.
final class MySQLDatabaseClientService implements DatabaseClientService {
  /// Stores the opened database connection.
  late final MySQLConnection? _connection;

  /// Stores the database properties.
  final DatabaseProperties _properties;

  /// Constructor
  MySQLDatabaseClientService({
    required DatabaseProperties properties,
  }) : _properties = properties;

  /// Responsible to open a MySQL connection.
  @override
  Future<void> openConnection() async {
    try {
      _connection = await MySQLConnection.createConnection(
        host: _properties.host,
        port: _properties.port,
        databaseName: _properties.name,
        userName: _properties.username,
        password: _properties.password,
      );
      await _connection?.connect();
    } on MySQLException catch (error, stackTrace) {
      throw DatabaseException(
        errorMessage: error.message,
        stackTrace: stackTrace,
      );
    } catch (error, stackTrace) {
      throw DatabaseException(
        errorMessage: 'Unhandled MySQL error: $error',
        stackTrace: stackTrace,
      );
    }
  }

  /// Responsible to disconnected from the MySQL already connected.
  @override
  Future<void> closeConnection() async {
    try {
      await _connection?.close();
    } on MySQLException catch (error, stackTrace) {
      throw DatabaseException(
        errorMessage: error.message,
        stackTrace: stackTrace,
      );
    } catch (error, stackTrace) {
      throw DatabaseException(
        errorMessage: 'Unhandled MySQL error: $error',
        stackTrace: stackTrace,
      );
    }
  }

  /// Responsible to execute a SQL query into MySQL database.
  @override
  Future<DatabaseResult> executeQuery({
    required String sql,
    Map<String, dynamic>? parameters,
  }) async {
    try {
      if (_connection != null) {
        final databaseResult = await _connection!.execute(sql, parameters);

        final result = DatabaseResult(
          rows: databaseResult.numOfRows,
          results: [],
        );

        for (var row in databaseResult.rows) {
          result.results.add(row.typedAssoc());
        }

        return result;
      }

      throw DatabaseException(
        errorMessage: 'MySQL connection is not opened.',
        sqlCommand: sql,
        sqlParameters: parameters,
      );
    } on MySQLException catch (error, stackTrace) {
      throw DatabaseException(
        errorMessage: error.message,
        sqlCommand: sql,
        sqlParameters: parameters,
        stackTrace: stackTrace,
      );
    } catch (error, stackTrace) {
      throw DatabaseException(
        errorMessage: 'Unhandled error: $error',
        sqlCommand: sql,
        sqlParameters: parameters,
        stackTrace: stackTrace,
      );
    }
  }
}
