// ignore_for_file: avoid_print
import 'package:crispin/crispin.dart';

class PrintTransport extends CrispinTransport {
  PrintTransport(this.highestLevel);
  final String highestLevel;

  bool isEnabled(int level) {
    final isEnabled = CrispinLoggerLevel.isValidName(highestLevel);
    if (isEnabled && highestLevel.isNotEmpty) {
      return level <= CrispinLoggerLevel.getFromName(highestLevel);
    }
    return false;
  }

  ///
  @override
  Future<void> info(String message, {Object? meta}) async {
    if (isEnabled(CrispinLoggerLevel.info)) {
      print('INFO: $message');
      if (meta != null) {
        print('   meta: $meta');
      }
      print('');
    }
  }

  ///
  @override
  Future<void> warn(String message, {Object? meta}) async {
    if (isEnabled(CrispinLoggerLevel.warn)) {
      print('WARN: $message');
      if (meta != null) {
        print('   meta: $meta');
      }
      print('');
    }
  }

  ///
  @override
  Future<void> debug(String message, {Object? meta}) async {
    if (isEnabled(CrispinLoggerLevel.debug)) {
      print('DEBUG: $message');
      if (meta != null) {
        print('   DEBUG meta: $meta');
      }
      print('');
    }
  }

  ///
  @override
  Future<void> silly(String message, {Object? meta}) async {
    // You can just fully ignore implementing a method but doing so means you're aware that you didn't implement it.
  }

  ///
  @override
  Future<void> error(String message, {Object? error, StackTrace? stackTrace}) async {
    if (isEnabled(CrispinLoggerLevel.error)) {
      print('ERROR: $message');
      if (error != null) {
        print('   error: ${error.toString()}');
      }
      if (stackTrace != null) {
        print('   stackTrace: ${stackTrace.toString()}');
      }
      print('');
    }
  }
}

void main() {
  Crispin().addTransport(PrintTransport('warn'));
  Crispin().warn('this is a warning');
  Crispin().info('Not enabled');
  try {
    throw Exception('Error for example');
  } catch (error, stackTrace) {
    Crispin().error('Handling Error', error: error, stackTrace: stackTrace);
  }
}
