/// This class represents the database properties used to connect to a supported
/// database client.
final class DatabaseProperties {
  /// Constains the database host
  final String host;

  /// Contains the database port
  final int port;

  /// Contains the database name
  final String name;

  /// Contains the database username
  final String username;

  /// Contains the database password
  final String password;

  /// Constructor
  const DatabaseProperties({
    required this.host,
    required this.port,
    required this.name,
    required this.username,
    required this.password,
  });

  /// DatabaseProperties equals method.
  @override
  bool operator ==(covariant DatabaseProperties other) {
    if (identical(this, other)) {
      return true;
    }

    return other.host == host &&
        other.port == port &&
        other.name == name &&
        other.username == username &&
        other.password == password;
  }

  /// DatabaseProperties hash code getter.
  @override
  int get hashCode {
    return host.hashCode ^
        port.hashCode ^
        name.hashCode ^
        username.hashCode ^
        password.hashCode;
  }

  /// DatabaseProperties toString method.
  @override
  String toString() {
    return 'DatabaseProperties(host: $host, port: $port, name: $name, username: $username, password: $password)';
  }
}
