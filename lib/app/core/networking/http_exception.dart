class ApiException implements Exception {
  ApiException(this.message);

  final dynamic message;

  @override
  String toString() {
    final Object? message = this.message;
    if (message == null) return 'ApiException';
    return '$message';
  }
}
