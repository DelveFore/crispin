/// Transports foundation class
class CrispinTransport {
  ///
  Future<void> info(Object? message, {Object? meta}) async {
    throw UnimplementedError('Implement info method');
  }

  ///
  Future<void> warn(Object? message, {Object? meta}) async {
    throw UnimplementedError('Implement warn method');
  }

  ///
  Future<void> debug(Object? message, {Object? meta}) async {
    throw UnimplementedError('Implement debug method');
  }

  ///
  Future<void> silly(Object? message, {Object? meta}) async {
    throw UnimplementedError('Implement silly method');
  }

  ///
  Future<void> error(String message, {Object? error, StackTrace? stackTrace}) async {
    throw UnimplementedError('Implement error method');
  }
}
