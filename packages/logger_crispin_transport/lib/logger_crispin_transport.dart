library logger_crispin_transport;

import 'package:crispin/crispin.dart';
import 'package:logger/logger.dart';

///
class LoggerCrispinTransportOptions {
  LoggerCrispinTransportOptions({
    required this.level,
    LogPrinter? printer,
  }) : printer = printer ?? PrefixPrinter(PrettyPrinter(colors: false));
  final LogPrinter printer;
  final String level;
}

///
class LoggerCrispinTransport extends CrispinTransport {
  LoggerCrispinTransport(this.options);
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
  Future<void> info(String message, {Object? meta}) async {
    if (isEnabled(CrispinLoggerLevel.info)) {
      var logger = Logger(
        printer: options.printer,
      );
      logger.i(message, meta);
    }
  }

  ///
  @override
  Future<void> warn(String message, {Object? meta}) async {
    if (isEnabled(CrispinLoggerLevel.warn)) {
      var logger = Logger(
        printer: options.printer,
      );
      logger.w(message, meta);
    }
  }

  ///
  @override
  Future<void> debug(String message, {Object? meta}) async {
    if (isEnabled(CrispinLoggerLevel.debug)) {
      var logger = Logger(
        printer: options.printer,
      );
      logger.d(message, meta);
    }
  }

  ///
  @override
  Future<void> silly(String message, {Object? meta}) async {
    var logger = Logger(
      printer: options.printer,
    );
    logger.v(message, meta);
  }

  ///
  @override
  Future<void> error(String message, {Object? error, StackTrace? stackTrace}) async {
    if (isEnabled(CrispinLoggerLevel.error)) {
      var logger = Logger(
        printer: options.printer,
      );
      logger.e(message, error, stackTrace);
    }
  }
}
