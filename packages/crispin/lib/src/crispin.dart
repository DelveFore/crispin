import 'package:crispin/src/crispin_transport.dart';

/// {@template crispin}
/// Crispin Logger for Dart and Flutter
/// {@endtemplate}
class Crispin {
  /// {@macro crispin}
  factory Crispin() {
    return _cache;
  }

  Crispin._internal();

  final List<CrispinTransport> _transports = [];

  static final Crispin _cache = Crispin._internal();

  /// Add transport to the logger
  void addTransport(CrispinTransport value) {
    _transports.add(value);
  }

  /// Remove a transport by Type
  void removeTransportByType(Type type) {
    _transports.removeWhere((element) => element.runtimeType == type);
  }

  /// Mostly used for unit testing in your code
  void removeAllTransports() {
    _transports.clear();
  }

  ///
  int get transportCount {
    return _transports.length;
  }

  /// Call all enabled transport [info] methods
  /// While the benefit depends on the transports, we recommend to invoking with stackTrace
  ///   e.g. Crispin().info('..', stackTrace: StackTrace.current)
  void info(String message, {Object? meta, StackTrace? stackTrace}) {
    for (final transport in _transports) {
      transport.info(message, meta: meta, stackTrace: stackTrace);
    }
  }

  /// Call all enabled transport [warn] methods
  /// While the benefit depends on the transports, we recommend to invoking with stackTrace
  ///   e.g. Crispin().warn('..', stackTrace: StackTrace.current)
  void warn(String message, {Object? meta, StackTrace? stackTrace}) {
    for (final transport in _transports) {
      transport.warn(message, meta: meta, stackTrace: stackTrace);
    }
  }

  /// Call all enabled transport [debug] methods
  void debug(String message, {Object? meta, StackTrace? stackTrace}) {
    for (final transport in _transports) {
      transport.debug(message, meta: meta, stackTrace: stackTrace);
    }
  }

  /// Call all enabled transport [silly] methods
  void silly(String message, {Object? meta, StackTrace? stackTrace}) {
    for (final transport in _transports) {
      transport.silly(message, meta: meta, stackTrace: stackTrace);
    }
  }

  /// Call all enabled transport [error] methods
  void error(String message, {Object? error, StackTrace? stackTrace}) {
    for (final transport in _transports) {
      transport.error(message, error: error, stackTrace: stackTrace);
    }
  }
}
