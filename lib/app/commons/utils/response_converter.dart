class ResponseConverter {
  ResponseConverter._();

  static convert<T>(
    Map<String, dynamic> response,
    Function(Map<String, dynamic>) base,
  ) {
    try {
      return base(response) as T;
    } catch (_) {
    }
  }
}
