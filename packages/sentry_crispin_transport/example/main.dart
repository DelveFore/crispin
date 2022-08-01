import 'package:crispin/crispin.dart';
import 'package:sentry_crispin_transport/src/sentry_crispin_transport.dart';

void main() {
  /// This example assumes, you have already configured
  /// Sentry in the application
  Crispin().addTransport(
    SentryCrispinTransport(
      SentryCrispinTransportOptions(level: 'error'),
    ),
  );
  Crispin().warn('Not enabled');
  Crispin().info('Not enabled');
  try {
    throw Exception('Error for example');
  } catch (error, stackTrace) {
    Crispin().error(
      'Handling Error',
      error: error,
      stackTrace: stackTrace,
    );
  }
}
