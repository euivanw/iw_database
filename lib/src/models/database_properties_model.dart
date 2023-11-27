final class DatabaseProperties {
  final String host;
  final int port;
  final String name;
  final String username;
  final String password;

  const DatabaseProperties({
    required this.host,
    required this.port,
    required this.name,
    required this.username,
    required this.password,
  });

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

  @override
  int get hashCode {
    return host.hashCode ^
        port.hashCode ^
        name.hashCode ^
        username.hashCode ^
        password.hashCode;
  }

  @override
  String toString() {
    return 'DatabaseProperties(host: $host, port: $port, name: $name, username: $username, password: $password)';
  }
}
