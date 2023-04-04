import 'package:json_annotation/json_annotation.dart';
import 'package:loomi_flutter_boilerplate/src/external/models/product_model.dart';
part "add_cart_model.g.dart";

@JsonSerializable()
class AddCartModel {
  final int quantity;
  final ProductModel paint;

  AddCartModel(
    this.quantity,
    this.paint,
  );

  factory AddCartModel.fromJson(Map<String, dynamic> json) =>
      _$AddCartModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddCartModelToJson(this);
}
