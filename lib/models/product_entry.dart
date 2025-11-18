// To parse this JSON data, do
//
//     final productEntry = productEntryFromJson(jsonString);

import 'dart:convert';

List<ProductEntry> productEntryFromJson(String str) => List<ProductEntry>.from(
  json.decode(str).map((x) => ProductEntry.fromJson(x)),
);

String productEntryToJson(List<ProductEntry> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductEntry {
  Model model;
  int pk;
  Fields fields;

  ProductEntry({required this.model, required this.pk, required this.fields});

  factory ProductEntry.fromJson(Map<String, dynamic> json) => ProductEntry(
    model: modelValues.map[json["model"]]!,
    pk: json["pk"],
    fields: Fields.fromJson(json["fields"]),
  );

  Map<String, dynamic> toJson() => {
    "model": modelValues.reverse[model],
    "pk": pk,
    "fields": fields.toJson(),
  };
}

class Fields {
  String name;
  String price;
  String description;
  String thumbnail;
  String category;
  bool isFeatured;
  int user;
  int stock;
  String brand;

  Fields({
    required this.name,
    required this.price,
    required this.description,
    required this.thumbnail,
    required this.category,
    required this.isFeatured,
    required this.user,
    required this.stock,
    required this.brand,
  });

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
    name: json["name"],
    price: json["price"],
    description: json["description"],
    thumbnail: json["thumbnail"],
    category: json["category"],
    isFeatured: json["is_featured"],
    user: json["user"],
    stock: json["stock"],
    brand: json["brand"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "price": price,
    "description": description,
    "thumbnail": thumbnail,
    "category": category,
    "is_featured": isFeatured,
    "user": user,
    "stock": stock,
    "brand": brand,
  };
}

enum Model { MAIN_PRODUCT }

final modelValues = EnumValues({"main.product": Model.MAIN_PRODUCT});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
