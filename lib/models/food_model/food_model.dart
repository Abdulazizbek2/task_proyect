// To parse this JSON data, do
//
//     final foodModel = foodModelFromJson(jsonString);

import 'dart:convert';

FoodModel foodModelFromJson(String str) => FoodModel.fromJson(json.decode(str));

String foodModelToJson(FoodModel data) => json.encode(data.toJson());

class FoodModel {
  String? id;
  String? name;
  String? imagePath;
  String? description;
  String? kitchen;
  List<String>? type;
  double? price;
  double? weight;

  FoodModel({
    this.id,
    this.name,
    this.imagePath,
    this.description,
    this.kitchen,
    this.type,
    this.price,
    this.weight,
  });

  FoodModel copyWith({
    String? id,
    String? name,
    String? imagePath,
    String? description,
    String? kitchen,
    List<String>? type,
    double? price,
    double? weight,
  }) =>
      FoodModel(
        id: id ?? this.id,
        name: name ?? this.name,
        imagePath: imagePath ?? this.imagePath,
        description: description ?? this.description,
        kitchen: kitchen ?? this.kitchen,
        type: type ?? this.type,
        price: price ?? this.price,
        weight: weight ?? this.weight,
      );

  factory FoodModel.fromJson(Map<String, dynamic> json) => FoodModel(
        id: json["id"],
        name: json["name"],
        imagePath: json["imagePath"],
        description: json["description"],
        kitchen: json["kitchen"],
        type: json["type"] == null
            ? []
            : List<String>.from(json["type"]!.map((x) => x)),
        price: json["price"]?.toDouble(),
        weight: json["weight"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "imagePath": imagePath,
        "description": description,
        "kitchen": kitchen,
        "type": type == null ? [] : List<dynamic>.from(type!.map((x) => x)),
        "price": price,
        "weight": weight,
      };
}
