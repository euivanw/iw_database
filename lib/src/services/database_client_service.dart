import '../models/database_result_model.dart';

abstract interface class DatabaseClientService {
  Future<void> openConnection();

  Future<void> closeConnection();

  Future<DatabaseResult> executeQuery({
    required String sql,
    Map<String, dynamic>? parameters,
  });
}
