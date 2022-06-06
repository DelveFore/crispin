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

  group('Crispin', () {
    test('can be instantiated', () {
      expect(crispin, isNotNull);
    });

    test('can add transport and call info() method', () {
      when(() => mockTransport.info(any(), meta: any(named: 'meta'))).thenAnswer((_) async {});
      crispin
        ..info('Testing')
        ..info('with meta', meta: ['id', 'key']);
      verify(() => mockTransport.info('Testing')).called(1);
      verify(() => mockTransport.info('with meta', meta: ['id', 'key'])).called(1);
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

    test('can add transport and call warn() method', () {
      when(() => mockTransport.warn(any(), meta: any(named: 'meta'))).thenAnswer((_) async {});
      crispin
        ..warn('Testing')
        ..warn('Test with meta', meta: {'id': 1});
      verify(() => mockTransport.warn('Testing')).called(1);
      verify(() => mockTransport.warn('Test with meta', meta: {'id': 1})).called(1);
    });

    test('can add transport and call debug() method', () {
      when(() => mockTransport.debug(any(), meta: any(named: 'meta'))).thenAnswer((_) async {});
      crispin
        ..debug('Testing debug')
        ..debug('debug with meta', meta: {'id': 1});
      verify(() => mockTransport.debug('Testing debug')).called(1);
      verify(() => mockTransport.debug('debug with meta', meta: {'id': 1})).called(1);
    });

    test('can add transport and call silly() method', () {
      when(() => mockTransport.silly(any(), meta: any(named: 'meta'))).thenAnswer((_) async {});
      crispin
        ..silly('Silly testing')
        ..silly('sillier because meta data', meta: {'id': 1});
      verify(() => mockTransport.silly('Silly testing')).called(1);
      verify(() => mockTransport.silly('sillier because meta data', meta: {'id': 1})).called(1);
    });
  });
}
