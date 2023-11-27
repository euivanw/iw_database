import 'package:mysql1/mysql1.dart';

import '../exceptions/database_exception.dart';
import '../models/database_properties_model.dart';
import 'database_service.dart';

final class MySQLDatabaseService implements DatabaseService {
  late final MySqlConnection? _connection;

  final DatabaseProperties _properties;

  MySQLDatabaseService({
    required DatabaseProperties properties,
  }) : _properties = properties;

  @override
  Future<void> open() async {
    try {
      _connection = await MySqlConnection.connect(
        ConnectionSettings(
          host: _properties.host,
          port: _properties.port,
          db: _properties.databaseName,
          user: _properties.username,
          password: _properties.password,
        ),
      );
    } catch (error, stackTrace) {
      throw DatabaseException(
        errorMessage:
            'Ocorreu um erro ao conectar na base de dados. Erro: ${error.toString()}',
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<void> close() async {
    await _connection?.close();
  }

  @override
  Future<dynamic> query({
    required String sql,
    List<dynamic>? values,
  }) async {
    try {
      if (_connection != null) {
        return await _connection!.query(sql, values);
      }
    } on MySqlException catch (error, stackTrace) {
      throw DatabaseException(
        errorMessage: error.message,
        stackTrace: stackTrace,
      );
    } catch (error, stackTrace) {
      throw DatabaseException(
        errorMessage:
            'Erro desconhecido ao executar a query [$sql]. Erro: ${error.toString()}.',
        stackTrace: stackTrace,
      );
    }
  }
}
