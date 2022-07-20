/// Transports foundation class
class CrispinTransport {
  ///
  Future<void> info(String message, {Object? meta, StackTrace? stackTrace}) async {
    throw UnimplementedError('Implement info method');
  }

  ///
  Future<void> warn(String message, {Object? meta, StackTrace? stackTrace}) async {
    throw UnimplementedError('Implement warn method');
  }

  ///
  Future<void> debug(String message, {Object? meta, StackTrace? stackTrace}) async {
    throw UnimplementedError('Implement debug method');
  }

  ///
  Future<void> silly(String message, {Object? meta, StackTrace? stackTrace}) async {
    throw UnimplementedError('Implement silly method');
  }

  ///
  Future<void> error(String message, {Object? error, StackTrace? stackTrace}) async {
    throw UnimplementedError('Implement error method');
  }
}
