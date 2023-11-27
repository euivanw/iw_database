import 'package:collection/collection.dart';

/// This class represents the database results returned by the supported
/// database client.
final class DatabaseResult {
  /// Rows affected by the query.
  final int rows;

  /// Results returned by the query.
  final List<Map<String, dynamic>> results;

  /// Constructor
  const DatabaseResult({
    required this.rows,
    required this.results,
  });

  /// DatabaseResult equals method.
  @override
  bool operator ==(covariant DatabaseResult other) {
    if (identical(this, other)) {
      return true;
    }

    final listEquals = const DeepCollectionEquality().equals;

    return other.rows == rows && listEquals(other.results, results);
  }

  /// DatabaseResult hash code getter.
  @override
  int get hashCode => rows.hashCode ^ results.hashCode;

  /// DatabaseResult toString method.
  @override
  String toString() {
    return 'DatabaseResult(rows: $rows, results: $results)';
  }
}
