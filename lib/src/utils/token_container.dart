class TokenContainer {
  static TokenContainer? _instance;
  late final String _token;

  String get token => _token;

  set token(String value) {
    _token = value;
  }

  TokenContainer._();

  factory TokenContainer() {
    return _instance ??= TokenContainer._();
  }
}
