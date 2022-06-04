import 'package:crispin/crispin.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockTransport extends Mock implements CrispinTransport {}

class MockStackTrace extends StackTrace {}

typedef TransportErrorHandler = Future<void> Function(String message, {Object? error, StackTrace? stackTrace});

void main() {
  group('Crispin', () {
    test('can be instantiated', () {
      expect(Crispin(), isNotNull);
    });

    test('can add transport and call info log method', () {
      final mockTransport = MockTransport();
      when(() => mockTransport.info('Testing')).thenAnswer(
        (Object? message, {Object? meta}) async {},
      );
      Crispin().addTransport(mockTransport);
      Crispin().info('Testing');
      verify(() => mockTransport.info('Testing')).called(1);
    });

    test('can add transport and call error log method with error', () {
      final mockTransport = MockTransport();

      when(
        () async => mockTransport.error(
          any(),
          error: any(named: 'error'),
          stackTrace: any(named: 'stackTrace'),
        ),
      ).thenAnswer(
        (_) async => Future<void>(() {}),
      );
      Crispin().addTransport(mockTransport);
      Crispin().error(
        'Testing',
        error: Exception('error'),
        stackTrace: MockStackTrace(),
      );
      verify(
        () => mockTransport.error(
          'Testing',
          error: Exception('error'),
          stackTrace: MockStackTrace(),
        ),
      ).called(1);
    });
  });
}
