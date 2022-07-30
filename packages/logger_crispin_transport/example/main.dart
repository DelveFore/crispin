import 'package:crispin/crispin.dart';
import 'package:logger_crispin_transport/logger_crispin_transport.dart';

void main() {
  Crispin().addTransport(LoggerCrispinTransport(LoggerCrispinTransportOptions(level: 'warn')));
  Crispin().warn('this is a warning', stackTrace: StackTrace.current);
  Crispin().warn('this is a warning without StackTrace');
  Crispin().info('Not enabled');
  try {
    throw Exception('Error for example');
  } catch (error, stackTrace) {
    Crispin().error('Handling Error', error: error, stackTrace: stackTrace);
  }
}
