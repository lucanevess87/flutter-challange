import 'package:dio/dio.dart';
import 'package:loomi_flutter_boilerplate/src/domain/repositories/i_cart_repository.dart';
import 'package:loomi_flutter_boilerplate/src/external/models/cart_product_model.dart';
import 'package:retrofit/retrofit.dart';

import '../models/add_cart_model.dart';

part "cart_datasource.g.dart";

@RestApi()
abstract class CartDataSource implements ICartRepository {
  factory CartDataSource(Dio dio, {String baseUrl}) = _CartDataSource;

  @override
  @GET("cart?page={page}&limit=10")
  Future<List<CartProductModel>> getPaginationCart({
    @Path("page") required int page,
  });

  @override
  @POST("cart")
  Future<CartProductModel> postAddCart({
    @Path("body") required AddCartModel body,
  });
}
