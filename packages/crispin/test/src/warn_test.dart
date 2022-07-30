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

  group('Crispin().warn()', () {
    test('can provide message', () {
      when(() => mockTransport.warn(any())).thenAnswer((_) async {});
      crispin.warn('Testing');

      verify(() => mockTransport.warn('Testing')).called(1);
    });

    test('can provide meta', () {
      when(() => mockTransport.warn(any(), meta: any(named: 'meta'))).thenAnswer((_) async {});
      crispin.warn('Testing', meta: {'id', 1});

      verify(() => mockTransport.warn('Testing', meta: {'id', 1})).called(1);
    });

    test('can provide stackTrace', () {
      when(
        () => mockTransport.warn(
          any(),
          meta: any(named: 'meta'),
          stackTrace: any(named: 'stackTrace'),
        ),
      ).thenAnswer((_) async {});
      final mockStackTrace = MockStackTrace();
      crispin
        ..warn('Testing with stackTrace', stackTrace: mockStackTrace)
        ..warn('with meta and stackTrace', meta: ['id', 'name'], stackTrace: mockStackTrace);
      verify(() => mockTransport.warn('Testing with stackTrace', stackTrace: mockStackTrace)).called(1);
      verify(() => mockTransport.warn('with meta and stackTrace', meta: ['id', 'name'], stackTrace: mockStackTrace))
          .called(1);
    });
  });
}
