import 'package:crispin/crispin.dart';
import 'package:sentry/sentry.dart';

///
class SentryCrispinTransportOptions {
  ///
  SentryCrispinTransportOptions({
    required this.level,
  });

  /// Crispin logging level for the transport
  final String level;
}

/// {@template sentry_crispin_transport}
/// Sentry Logger for Crispin
/// This class is a [CrispinTransport] that sends log messages to Sentry
/// Configuring the sentry is not part of the package, it should be done outside
/// {@endtemplate}
class SentryCrispinTransport extends CrispinTransport {
  /// {@macro sentry_crispin_transport}
  SentryCrispinTransport(this.options);

  /// Options that goes along `SentryCrispinTransport`
  final SentryCrispinTransportOptions options;

  ///
  bool isEnabled(int level) {
    final isEnabled = CrispinLoggerLevel.isValidName(options.level);
    if (isEnabled && options.level.isNotEmpty) {
      return level <= CrispinLoggerLevel.getFromName(options.level);
    }
    return false;
  }

  ///
  @override
  Future<void> info(
    String message, {
    Object? meta,
    StackTrace? stackTrace,
  }) async {
    if (isEnabled(CrispinLoggerLevel.info)) {
      await Sentry.captureMessage(message);
    }
  }

  ///
  @override
  Future<void> warn(
    String message, {
    Object? meta,
    StackTrace? stackTrace,
  }) async {
    if (isEnabled(CrispinLoggerLevel.warn)) {
      await Sentry.captureMessage(message, level: SentryLevel.warning);
    }
  }

  ///
  @override
  Future<void> debug(
    String message, {
    Object? meta,
    StackTrace? stackTrace,
  }) async {
    if (isEnabled(CrispinLoggerLevel.debug)) {
      await Sentry.captureMessage(message, level: SentryLevel.debug);
    }
  }

  ///
  @override
  Future<void> silly(
    String message, {
    Object? meta,
    StackTrace? stackTrace,
  }) async {
    if (isEnabled(CrispinLoggerLevel.silly)) {
      await Sentry.captureMessage(
        message,
        level: SentryLevel.fromName('silly'),
      );
    }
  }

  ///
  @override
  Future<void> error(
    String message, {
    Object? error,
    StackTrace? stackTrace,
  }) async {
    if (isEnabled(CrispinLoggerLevel.error)) {
      final exception = error is Exception ? error : null;
      final sentryEvent = SentryEvent(
        message: SentryMessage(message),
        timestamp: DateTime.now().toUtc(),
        throwable: exception ?? message,
      );
      await Sentry.captureEvent(sentryEvent, stackTrace: StackTrace.current);
    }
  }
}
