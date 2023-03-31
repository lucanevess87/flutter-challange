import 'package:loomi_flutter_boilerplate/src/presentation/views/store/components/home/productsView/product.dart';
import 'package:mobx/mobx.dart';

part 'cart_store.g.dart';

class CartStore = _CartStoreBase with _$CartStore;

abstract class _CartStoreBase with Store {
  @observable
  ObservableList<Product> cartList = ObservableList();

  @action
  void addProduct(Product product) {
    cartList.add(product);
  }

  @action
  void removeProduct(int id) {
    cartList.removeWhere((element) => element.id == id);
  }
}
