import 'dart:convert';

class Whisky {
  String distillery;
  String name;
  // Alcohol by Volume, as a percentage
  double? abv;
  // Total volume per bottle, in milliliters
  int? size;
  // Year in which the whisky was bottled
  int? year;
  int? barcode;
  int? whiskyId;
  // Price of whisky, in Euros
  double? price;

  Whisky({
    required this.distillery,
    required this.name,
    required this.abv,
    required this.size,
    required this.year,
    required this.barcode,
    required this.whiskyId,
    required this.price,
  });

  Whisky copyWith({
    String? distillery,
    String? name,
    double? abv,
    int? size,
    int? year,
    int? barcode,
    int? whiskyId,
    double? price,
  }) {
    return Whisky(
      distillery: distillery ?? this.distillery,
      name: name ?? this.name,
      abv: abv ?? this.abv,
      size: size ?? this.size,
      year: year ?? this.year,
      barcode: barcode ?? this.barcode,
      whiskyId: whiskyId ?? this.whiskyId,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'distillery': distillery,
      'name': name,
      'abv': abv,
      'size': size,
      'year': year,
      'barcode': barcode,
      'whiskyId': whiskyId,
      'price': price,
    };
  }

  factory Whisky.fromMap(Map<String, dynamic> map) {
    return Whisky(
      distillery: map['distillery'] ?? '',
      name: map['name'] ?? '',
      abv: map['abv']?.toDouble(),
      size: map['size']?.toInt(),
      year: map['year']?.toInt(),
      barcode: map['barcode']?.toInt(),
      whiskyId: map['whiskyId']?.toInt(),
      price: map['price']?.toDouble(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Whisky.fromJson(String source) => Whisky.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Whisky(distillery: $distillery, name: $name, abv: $abv, size: $size, year: $year, barcode: $barcode, whiskyId: $whiskyId, price: $price)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Whisky &&
        other.distillery == distillery &&
        other.name == name &&
        other.abv == abv &&
        other.size == size &&
        other.year == year &&
        other.barcode == barcode &&
        other.whiskyId == whiskyId &&
        other.price == price;
  }

  @override
  int get hashCode {
    return distillery.hashCode ^
        name.hashCode ^
        abv.hashCode ^
        size.hashCode ^
        year.hashCode ^
        barcode.hashCode ^
        whiskyId.hashCode ^
        price.hashCode;
  }
}
