import 'package:crispin/crispin.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class Mock1Transport extends Mock implements CrispinTransport {}

class Mock2Transport extends Mock implements CrispinTransport {}

class MockStackTrace extends Mock implements StackTrace {}

typedef TransportErrorHandler = Future<void> Function(String message, {Object? error, StackTrace? stackTrace});

void main() {
  tearDown(resetMocktailState);

  group('Crispin', () {
    tearDown(() => Crispin().removeAllTransports());
    test('can be instantiated', () {
      expect(Crispin(), isNotNull);
    });
    test('can add transport', () {
      final mock1Transport = Mock1Transport();
      Crispin().addTransport(mock1Transport);
      when(() => mock1Transport.debug(any())).thenAnswer((_) async {});
      expect(Crispin().transportCount, 1);
    });
    test('remove transport by Type', () {
      final mock1Transport = Mock1Transport();
      final mock2Transport = Mock2Transport();
      Crispin().addTransport(mock1Transport);
      Crispin().addTransport(mock2Transport);
      expect(Crispin().transportCount, 2);
      when(() => mock1Transport.debug(any())).thenAnswer((_) async {});
      when(() => mock2Transport.debug(any())).thenAnswer((_) async {});
      Crispin().removeTransportByType(Mock1Transport);
      expect(Crispin().transportCount, 1);
    });
  });
}
