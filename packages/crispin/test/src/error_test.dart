import 'package:crispin/crispin.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockTransport extends Mock implements CrispinTransport {}

class MockStackTrace extends Mock implements StackTrace {}

class MockError extends Mock implements Error {}

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

  group('Crispin().error()', () {
    test('can provide message', () {
      when(() => mockTransport.error(any())).thenAnswer((_) async {});
      crispin.error('Testing');

      verify(() => mockTransport.error('Testing')).called(1);
    });

    test('can provide error', () {
      when(
        () => mockTransport.error(
          any(),
          error: any(named: 'error'),
          stackTrace: any(named: 'stackTrace'),
        ),
      ).thenAnswer((_) async {});

      final error = MockError();

      crispin.error('Error occurred', error: error);

      verify(() => mockTransport.error('Error occurred', error: error)).called(1);
    });

    test('can provide stackTrace', () {
      when(
        () => mockTransport.error(
          any(),
          error: any(named: 'error'),
          stackTrace: any(named: 'stackTrace'),
        ),
      ).thenAnswer((_) async {});
      final mockStackTrace = MockStackTrace();
      final error = MockError();
      crispin
        ..error('Testing with stackTrace', stackTrace: mockStackTrace)
        ..error('with error and stackTrace', error: error, stackTrace: mockStackTrace);
      verify(() => mockTransport.error('Testing with stackTrace', error: isNull, stackTrace: mockStackTrace)).called(1);
      verify(
        () => mockTransport.error(
          'with error and stackTrace',
          error: error,
          stackTrace: mockStackTrace,
        ),
      ).called(1);
    });

    test('can add transport and call error() method', () {
      when(
        () => mockTransport.error('Testing', error: any(named: 'error'), stackTrace: any(named: 'stackTrace')),
      ).thenAnswer((_) async {});
      crispin.error(
        'Testing',
        error: Error(),
        stackTrace: MockStackTrace(),
      );
      verify(
        () => mockTransport.error(
          any(),
          error: any(named: 'error'),
          stackTrace: any(named: 'stackTrace'),
        ),
      ).called(1);
    });
  });
}
