import 'package:crispin/crispin.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockTransport extends Mock implements CrispinTransport {}

class MockStackTrace extends Mock implements StackTrace {}

typedef TransportErrorHandler = Future<void> Function(String message, {Object? error, StackTrace? stackTrace});

void main() {
  group('Crispin', () {
    test('can be instantiated', () {
      expect(Crispin(), isNotNull);
    });

    test('can add transport and call info() method', () {
      final mockTransport = MockTransport();
      when(() => mockTransport.info(any(), meta: any(named: 'meta'))).thenAnswer((_) async {});
      Crispin().addTransport(mockTransport);
      Crispin().info('Testing');
      Crispin().info('with meta', meta: ['id', 'key']);
      verify(() => mockTransport.info('Testing')).called(1);
      verify(() => mockTransport.info('with meta', meta: ['id', 'key'])).called(1);
      reset(mockTransport);
    });

    test('can add transport and call error() method', () {
      final mockTransport = MockTransport();

      when(
        () => mockTransport.error('Testing', error: any(named: 'error'), stackTrace: any(named: 'stackTrace')),
      ).thenAnswer((_) async {});
      Crispin().addTransport(mockTransport);
      Crispin().error(
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
      reset(mockTransport);
    });

    test('can add transport and call warn() method', () {
      final mockTransport = MockTransport();
      when(() => mockTransport.warn(any(), meta: any(named: 'meta'))).thenAnswer((_) async {});
      Crispin().addTransport(mockTransport);
      Crispin().warn('Testing');
      Crispin().warn('Test with meta', meta: {'id': 1});
      verify(() => mockTransport.warn('Testing')).called(1);
      verify(() => mockTransport.warn('Test with meta', meta: {'id': 1})).called(1);
      reset(mockTransport);
    });

    test('can add transport and call debug() method', () {
      final mockTransport = MockTransport();
      when(() => mockTransport.debug(any(), meta: any(named: 'meta'))).thenAnswer((_) async {});
      Crispin().addTransport(mockTransport);
      Crispin().debug('Testing debug');
      Crispin().debug('debug with meta', meta: {'id': 1});
      verify(() => mockTransport.debug('Testing debug')).called(1);
      verify(() => mockTransport.debug('debug with meta', meta: {'id': 1})).called(1);
      reset(mockTransport);
    });

    test('can add transport and call silly() method', () {
      final mockTransport = MockTransport();
      when(() => mockTransport.silly(any(), meta: any(named: 'meta'))).thenAnswer((_) async {});
      Crispin().addTransport(mockTransport);
      Crispin().silly('Silly testing');
      Crispin().silly('sillier because meta data', meta: {'id': 1});
      verify(() => mockTransport.silly('Silly testing')).called(1);
      verify(() => mockTransport.silly('sillier because meta data', meta: {'id': 1})).called(1);
      reset(mockTransport);
    });
  });
}
