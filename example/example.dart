import 'dart:io';

import 'package:iw_database/iw_database.dart';

Future<void> main() async {
  try {
    final DatabaseProperties properties = DatabaseProperties(
      host: 'localhost',
      port: 3306,
      name: 'tests',
      username: 'root',
      password: 'wrah-baft-krup-cex-TEEH',
      secure: false,
    );

    final DatabaseClientService service = MySQLDatabaseClientService(
      properties: properties,
    );

    await service.openConnection();

    final results = await service.executeQuery(
      sql: 'SELECT id, name FROM test_table WHERE id > :id',
      parameters: {
        'id': 5,
      },
    );

    print(results);

    await service.closeConnection();

    exit(0);
  } on DatabaseException catch (error) {
    print(error);
    exit(-1);
  }
}
