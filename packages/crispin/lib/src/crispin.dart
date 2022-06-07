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

  /// Call all enabled transport [info] methods
  void info(String message, {Object? meta}) {
    for (final transport in _transports) {
      transport.info(message, meta: meta);
    }
  }

  /// Call all enabled transport [warn] methods
  void warn(String message, {Object? meta}) {
    for (final transport in _transports) {
      transport.warn(message, meta: meta);
    }
  }

  /// Call all enabled transport [debug] methods
  void debug(String message, {Object? meta}) {
    for (final transport in _transports) {
      transport.debug(message, meta: meta);
    }
  }

  /// Call all enabled transport [silly] methods
  void silly(String message, {Object? meta}) {
    for (final transport in _transports) {
      transport.silly(message, meta: meta);
    }
  }

  /// Call all enabled transport [error] methods
  void error(String message, {Object? error, StackTrace? stackTrace}) {
    for (final transport in _transports) {
      transport.error(message, error: error, stackTrace: stackTrace);
    }
  }
}
