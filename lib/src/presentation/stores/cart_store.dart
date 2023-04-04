import 'package:get_it/get_it.dart';
import 'package:loomi_flutter_boilerplate/src/domain/repositories/i_cart_repository.dart';
import 'package:loomi_flutter_boilerplate/src/external/models/product_model.dart';
import 'package:mobx/mobx.dart';

import '../../external/models/add_cart_model.dart';

part 'cart_store.g.dart';

class CartStore = _CartStoreBase with _$CartStore;

abstract class _CartStoreBase with Store {
  @observable
  ObservableList<ProductModel> cartList = ObservableList();

  @action
  void addToCart(ProductModel product) {
    cartList.add(product);
  }

  @action
  void removeProduct(String id) {
    cartList.removeWhere((element) => element.id == id);
  }

  @action
  Future<void> addProductToCart(AddCartModel product) async {
    await GetIt.I.get<ICartRepository>().postAddCart(body: product);
  }
}
