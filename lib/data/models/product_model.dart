import 'dart:convert';

class ProductModel {
  final String name;
  final String tag;
  final String location;
  ProductModel({
    required this.name,
    required this.tag,
    required this.location,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'tag': tag,
      'location': location,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      name: map['name'] ?? '',
      tag: map['tag'] ?? '',
      location: map['location'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source));
}
