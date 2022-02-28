import 'package:whiskybase/src/models/whisky.dart';
import 'package:whiskybase/whiskybase.dart';
import 'package:test/test.dart';

void main() {
  group('WhiskyBase: ', () {
    final wb = WhiskyBase();

    test('Get Ardbeg Blaaack (141710)', () async {
      final whisky = await wb.getWhisky(141710);
      expect(whisky, isA<Whisky>());
      if (whisky == null) return;
      expect(whisky.distillery, equals('Ardbeg'));
      expect(whisky.name, equals('Ardbeg Blaaack'));
      expect(whisky.abv, equals(50.7));
      expect(whisky.size, equals(750));
      expect(whisky.year, equals(2019));
      expect(whisky.barcode, equals(81753832605));
      expect(whisky.whiskyId, equals(141710));
      expect(whisky.price, isA<double>());
    });
  });
}
