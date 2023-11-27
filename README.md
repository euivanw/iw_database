# iw_database

This project is an implementation that allow developers to encapsulate their own usage of database clients.

The main objective of this project is to create a package that provide a database client encapsulated and by doing this allow developers to use it in many apps rather than create their own encapsulation for each project.

For now, the package supports only MySQL, however, other database clients could be supported in the future.

## Usage

Here is an example that make some SQL requests using the supported MySQL method and also the way to handle database exceptions.

You can also read the unit tests to see all the possibilities that the implementation supports.

```dart
import 'dart:io';

import 'package:iw_database/iw_database.dart';

Future<void> main() async {
  try {
    final DatabaseProperties properties = DatabaseProperties(
      host: 'localhost',
      port: 3306,
      name: 'tests',
      username: 'root',
      password: 'root',
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
    
    // Prints:
    // DatabaseResult(rows: 5, results: [{id: 6, name: Teste 06}, {id: 7, name: Teste 07}, {id: 8, name: Teste 08}, {id: 9, name: Teste 09}, {id: 10, name: Teste 10}])


    await service.closeConnection();

    exit(0);
  } on DatabaseException catch (error) {
    print(error);
    exit(-1);
  }
}
```
Feito com &hearts; por Ivan Wilhelm.

Codificado no [Visual Studio Code](https://code.visualstudio.com) da [Microsoft](https://www.microsoft.com.br)
