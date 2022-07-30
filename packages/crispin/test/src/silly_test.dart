import 'package:crispin/crispin.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockTransport extends Mock implements CrispinTransport {}

class MockStackTrace extends Mock implements StackTrace {}

typedef TransportErrorHandler = Future<void> Function(String message, {Object? error, StackTrace? stackTrace});

void main() {
  late MockTransport mockTransport;
  late Crispin crispin;

  setUpAll(() {
    crispin = Crispin();
    mockTransport = MockTransport();

    crispin.addTransport(mockTransport);
  });

  tearDown(resetMocktailState);

  group('Crispin().silly()', () {
    test('can provide message and meta', () {
      when(() => mockTransport.silly(any(), meta: any(named: 'meta'))).thenAnswer((_) async {});
      crispin
        ..silly('Testing')
        ..silly('with meta', meta: ['id', 'key']);
      verify(() => mockTransport.silly('Testing')).called(1);
      verify(() => mockTransport.silly('with meta', meta: ['id', 'key'])).called(1);
    });

    test('can provide stackTrace', () {
      when(
        () => mockTransport.silly(
          any(),
          meta: any(named: 'meta'),
          stackTrace: any(named: 'stackTrace'),
        ),
      ).thenAnswer((_) async {});
      final mockStackTrace = MockStackTrace();
      crispin
        ..silly('Testing with stackTrace', stackTrace: mockStackTrace)
        ..silly('with meta and stackTrace', meta: ['id', 'name'], stackTrace: mockStackTrace);
      verify(() => mockTransport.silly('Testing with stackTrace', stackTrace: mockStackTrace)).called(1);
      verify(() => mockTransport.silly('with meta and stackTrace', meta: ['id', 'name'], stackTrace: mockStackTrace))
          .called(1);
    });
  });
}
