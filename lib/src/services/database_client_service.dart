import '../models/database_result_model.dart';

/// This interface represents the service responsible to implemented the
/// required methods to implement a database client.
abstract interface class DatabaseClientService {
  /// Responsible to open a database connection.
  Future<void> openConnection();

  /// Responsible to disconnected from a database already connected.
  Future<void> closeConnection();

  /// Responsible to execute a SQL query into the database.
  Future<DatabaseResult> executeQuery({
    required String sql,
    Map<String, dynamic>? parameters,
  });
}
