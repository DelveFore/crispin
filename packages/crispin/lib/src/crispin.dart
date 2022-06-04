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

  ///
  void addTransport(CrispinTransport value) {
    _transports.add(value);
  }

  List<CrispinTransport> get transports {
    return _transports;
  }

  ///
  void info(Object? message, {Object? meta}) {
    for (final transport in _transports) {
      transport.info(message, meta: meta);
    }
  }

  ///
  void warn(Object? message, {Object? meta}) {
    for (final transport in _transports) {
      transport.warn(message, meta: meta);
    }
  }

  ///
  void debug(Object? message, {Object? meta}) {
    for (final transport in _transports) {
      transport.debug(message, meta: meta);
    }
  }

  void silly(Object? message, {Object? meta}) {
    for (final transport in _transports) {
      transport.silly(message, meta: meta);
    }
  }

  /// Call all enabled transport error methods
  void error(String message, {Object? error, StackTrace? stackTrace}) {
    for (final transport in _transports) {
      transport.error(message, error: error, stackTrace: stackTrace);
    }
  }
}
