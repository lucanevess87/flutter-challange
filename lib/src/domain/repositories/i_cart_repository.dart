import 'package:loomi_flutter_boilerplate/src/external/models/cart_product_model.dart';
import '../../external/models/add_cart_model.dart';

abstract class ICartRepository {
  Future<List<CartProductModel>> getPaginationCart({required int page});
  Future<CartProductModel> postAddCart({required AddCartModel body});
}
