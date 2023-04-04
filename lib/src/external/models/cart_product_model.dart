import 'package:json_annotation/json_annotation.dart';
import 'package:loomi_flutter_boilerplate/src/external/models/product_model.dart';
part "cart_product_model.g.dart";

@JsonSerializable()
class CartProductModel {
  final String id;
  final int quantity;
  final ProductModel paint;

  CartProductModel(
    this.id,
    this.quantity,
    this.paint,
  );

  factory CartProductModel.fromJson(Map<String, dynamic> json) =>
      _$CartProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$CartProductModelToJson(this);
}
