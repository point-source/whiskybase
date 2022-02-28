import 'package:whiskybase/src/models/whisky.dart';
import 'package:web_scraper/web_scraper.dart';

class WhiskyBase {
  Future<Whisky?> getWhisky(int whiskyId) async {
    final scraper = WebScraper('https://www.whiskybase.com');
    if (await scraper.loadWebPage('/whiskies/whisky/$whiskyId')) {
      final detailNames = scraper.getElementTitle('.block-desc > dl > dt');
      final details = scraper.getElementTitle('.block-desc > dl > dd');
      final detailMap = <String, String>{};
      for (var i = 0; i < details.length; i++) {
        detailMap.addAll({
          detailNames[i]: details[i],
        });
      }
      final name = scraper
          .getElementTitle('div.wb--notes-header > h2:nth-child(1)')
          .first
          .replaceFirst('Whisky Reviews for', '')
          .replaceAll('\n', '')
          .replaceAll('	', '')
          .trim();
      final price = double.tryParse(scraper
          .getElementTitle('div.block-price > p')
          .last
          .replaceAll('€ ', ''));

      return Whisky(
        distillery: detailMap['Distillery'] ?? '',
        name: name,
        abv: double.tryParse(
          detailMap['Strength']?.replaceFirst(' % Vol.', '') ?? '',
        ),
        size: int.tryParse(detailMap['Size']?.replaceFirst(' ml', '') ?? ''),
        year: int.tryParse(detailMap['Bottled'] ?? ''),
        barcode: int.tryParse(detailMap['Barcode'] ?? ''),
        whiskyId: int.tryParse(
              detailMap['Whiskybase ID']?.replaceFirst('WB', '') ?? '',
            ) ??
            whiskyId,
        price: price,
      );
    }

    return null;
  }
}
