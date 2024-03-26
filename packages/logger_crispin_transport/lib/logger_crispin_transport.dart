library logger_crispin_transport;

import 'package:crispin/crispin.dart';
import 'package:logger/logger.dart';

///
class LoggerCrispinTransportOptions {
  ///
  LoggerCrispinTransportOptions({
    required this.level,
    LogPrinter? printer,
    this.output,
    this.filter,
  }) : printer = printer ?? PrefixPrinter(PrettyPrinter(colors: false));

  ///
  final LogPrinter printer;

  ///
  final String level;

  ///
  final LogOutput? output;

  ///
  final LogFilter? filter;
}

///
class LoggerCrispinTransport extends CrispinTransport {
  ///
  LoggerCrispinTransport(this.options);

  ///
  final LoggerCrispinTransportOptions options;

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
      Logger(
        printer: options.printer,
        filter: options.filter,
        output: options.output,
      ).i(
        message,
        stackTrace: stackTrace,
        time: DateTime.now(),
      );
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
      Logger(
        printer: options.printer,
        filter: options.filter,
        output: options.output,
      ).w(
        message,
        stackTrace: stackTrace,
        time: DateTime.now(),
      );
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
      Logger(
        printer: options.printer,
        filter: options.filter,
        output: options.output,
      ).d(
        message,
        stackTrace: stackTrace,
        time: DateTime.now(),
      );
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
      Logger(
        printer: options.printer,
        filter: options.filter,
        output: options.output,
      ).t(
        message,
        stackTrace: stackTrace,
        time: DateTime.now(),
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
      Logger(
        printer: options.printer,
        filter: options.filter,
        output: options.output,
      ).e(
        message,
        stackTrace: stackTrace,
        error: error,
        time: DateTime.now(),
      );
    }
  }
}
