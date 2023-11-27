import 'package:collection/collection.dart';

class DatabaseResult {
  final int rows;
  final List<Map<String, dynamic>> results;

  const DatabaseResult({
    required this.rows,
    required this.results,
  });

  @override
  bool operator ==(covariant DatabaseResult other) {
    if (identical(this, other)) {
      return true;
    }

    final listEquals = const DeepCollectionEquality().equals;

    return other.rows == rows && listEquals(other.results, results);
  }

  @override
  int get hashCode => rows.hashCode ^ results.hashCode;

  @override
  String toString() {
    return 'DatabaseResult(rows: $rows, results: $results)';
  }
}
