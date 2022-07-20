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

  group('Crispin().info()', () {
    test('can provide message and meta', () {
      when(() => mockTransport.info(any(), meta: any(named: 'meta'))).thenAnswer((_) async {});
      crispin
        ..info('Testing')
        ..info('with meta', meta: ['id', 'key']);
      verify(() => mockTransport.info('Testing')).called(1);
      verify(() => mockTransport.info('with meta', meta: ['id', 'key'])).called(1);
    });

    test('can provide stackTrace', () {
      when(
        () => mockTransport.info(
          any(),
          meta: any(named: 'meta'),
          stackTrace: any(named: 'stackTrace'),
        ),
      ).thenAnswer((_) async {});
      final mockStackTrace = MockStackTrace();
      crispin
        ..info('Testing with stackTrace', stackTrace: mockStackTrace)
        ..info('with meta and stackTrace', meta: ['id', 'name'], stackTrace: mockStackTrace);
      verify(() => mockTransport.info('Testing with stackTrace', stackTrace: mockStackTrace)).called(1);
      verify(() => mockTransport.info('with meta and stackTrace', meta: ['id', 'name'], stackTrace: mockStackTrace))
          .called(1);
    });
  });
}
