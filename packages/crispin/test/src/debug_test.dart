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

  group('Crispin().debug()', () {
    test('can provide message', () {
      when(() => mockTransport.debug(any())).thenAnswer((_) async {});
      crispin.debug('Testing');

      verify(() => mockTransport.debug('Testing')).called(1);
    });

    test('can provide meta', () {
      when(() => mockTransport.debug(any(), meta: any(named: 'meta'))).thenAnswer((_) async {});
      crispin.debug('Testing', meta: {'id', 1});

      verify(() => mockTransport.debug('Testing', meta: {'id', 1})).called(1);
    });

    test('can provide stackTrace', () {
      when(
        () => mockTransport.debug(
          any(),
          meta: any(named: 'meta'),
          stackTrace: any(named: 'stackTrace'),
        ),
      ).thenAnswer((_) async {});
      final mockStackTrace = MockStackTrace();
      crispin
        ..debug('Testing with stackTrace', stackTrace: mockStackTrace)
        ..debug('with meta and stackTrace', meta: ['id', 'name'], stackTrace: mockStackTrace);
      verify(() => mockTransport.debug('Testing with stackTrace', stackTrace: mockStackTrace)).called(1);
      verify(() => mockTransport.debug('with meta and stackTrace', meta: ['id', 'name'], stackTrace: mockStackTrace))
          .called(1);
    });
  });
}
