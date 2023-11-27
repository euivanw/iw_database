abstract interface class DatabaseService {
  Future<void> open();

  Future<void> close();

  Future<dynamic> query({
    required String sql,
    List<dynamic>? values,
  });
}
