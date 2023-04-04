import 'package:get_it/get_it.dart';
import 'package:loomi_flutter_boilerplate/src/domain/repositories/i_marketplace_repository.dart';
import 'package:loomi_flutter_boilerplate/src/external/models/product_model.dart';
import 'package:mobx/mobx.dart';
part 'marketplace_store.g.dart';

class MarketPlaceStore = _MarketPlaceStoreBase with _$MarketPlaceStore;

abstract class _MarketPlaceStoreBase with Store {
  @observable
  bool loading = false;

  @observable
  ObservableList<ProductModel> productList = ObservableList();

  @observable
  bool defaultView = true;

  @observable
  bool isDeliveryFree = false;

  @observable
  String selectedProductId = "";

  @observable
  int page = 1;

  @observable
  String search = "";

  @action
  void changeView(bool view) {
    defaultView = view;
  }

  @action
  void setSelectedProduct(String id) {
    selectedProductId = id;
  }

  @action
  Future<void> setSearch(String value) async {
    productList.clear();

    loading = true;
    var aux = await GetIt.I
        .get<IMarketplaceRepository>()
        .getPaginationMarketplace(page: page, search: value);
    loading = false;

    productList.addAll(aux);
  }

  @action
  Future<void> loadMoreProducts() async {
    loading = true;
    var aux = await GetIt.I
        .get<IMarketplaceRepository>()
        .getPaginationMarketplace(page: page + 1, search: search);
    loading = false;
    productList.addAll(aux);
  }

  @action
  void setPage(int requestedPage) {
    page = requestedPage;
  }

  @action
  filterByDeliveryStatus(bool value) {
    if (value) {
      isDeliveryFree = true;
      productList.retainWhere((element) => element.deliveryFree == value);
    } else {
      isDeliveryFree = false;
      productList.clear();
      getMarketplaceProducts();
    }
  }

  @action
  Future<void> getMarketplaceProducts() async {
    loading = true;
    var aux = await GetIt.I
        .get<IMarketplaceRepository>()
        .getPaginationMarketplace(page: page, search: search);
    loading = false;
    productList.addAll(aux);
  }
}
