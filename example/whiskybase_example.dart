import 'package:whiskybase/whiskybase.dart';

void main() async {
  final wb = WhiskyBase();
  final whisky = await wb.getWhisky(141710); // Ardbeg Blaaack
  print(whisky.toString());
}
