import 'package:crispin/crispin.dart';
import 'package:logger/logger.dart';
import 'package:logger_crispin_transport/logger_crispin_transport.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockOutput extends Mock implements LogOutput {}

class FakeOutputEvent extends Fake implements OutputEvent {}

void main() {
  late MockOutput output;
  late Crispin crispin;

  setUpAll(() {
    crispin = Crispin();
    output = MockOutput();

    registerFallbackValue(FakeOutputEvent());
    crispin.addTransport(
      LoggerCrispinTransport(
        LoggerCrispinTransportOptions(
          level: 'silly',
          output: output,
        ),
      ),
    );
  });

  tearDown(resetMocktailState);

  group('error()', () {
    test('Logger.e is called', () {
      when(() => output.output(any())).thenAnswer((invocation) {});
      crispin.error('Testing');
      verify(() => output.output(any())).called(1);
    });
  });
}
