import 'package:json_annotation/json_annotation.dart';

part "product_model.g.dart";

@JsonSerializable()
class ProductModel {
  final String id;
  final String name;
  final String price;
  final String coverImage;
  final bool deliveryFree;
  final String description;

  ProductModel(
    this.id,
    this.name,
    this.price,
    this.coverImage,
    this.deliveryFree,
    this.description,
  );

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}
