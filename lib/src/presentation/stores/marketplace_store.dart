import 'package:loomi_flutter_boilerplate/src/presentation/views/store/components/home/productsView/product.dart';
import 'package:mobx/mobx.dart';
part 'marketplace_store.g.dart';

class MarketPlaceStore = _MarketPlaceStoreBase with _$MarketPlaceStore;

List<Product> storeListModel = [
  const Product(
      id: 1,
      name: "Tinta Suvinil Criativa",
      price: 95.00,
      image: "",
      isFree: true),
  const Product(
      id: 2,
      name: "Tinta Iquine Criativa",
      price: 95.00,
      image: "",
      isFree: true),
  const Product(
      id: 3,
      name: "Tinta Iquine Classica",
      price: 95.00,
      image: "",
      isFree: true),
  const Product(
      id: 4,
      name: "Tinta Iquine Novidade",
      price: 95.00,
      image: "",
      isFree: false),
  const Product(
      id: 5,
      name: "Tinta Iquine Maravilha",
      price: 95.00,
      image: "",
      isFree: false),
  const Product(
      id: 6,
      name: "Tinta Iquine Branco",
      price: 95.00,
      image: "",
      isFree: false),
  const Product(
      id: 7, name: "Tinta Iquine Gelo", price: 95.00, image: "", isFree: true),
  const Product(
      id: 8,
      name: "Tinta Iquine Criativa",
      price: 95.00,
      image: "",
      isFree: true),
  const Product(
      id: 9,
      name: "Tinta Iquine Criativa",
      price: 95.00,
      image: "",
      isFree: false),
  const Product(
      id: 10,
      name: "Tinta Iquine Criativa",
      price: 95.00,
      image: "",
      isFree: false),
  const Product(
      id: 11,
      name: "Tinta Iquine Criativa",
      price: 95.00,
      image: "",
      isFree: false),
  const Product(
      id: 12,
      name: "Tinta Iquine Criativa",
      price: 95.00,
      image: "",
      isFree: true),
];

abstract class _MarketPlaceStoreBase with Store {
  @observable
  ObservableList<Product> storeList = ObservableList.of(storeListModel);

  @observable
  bool defaultView = true;

  @observable
  int selectedProductId = 0;

  @action
  void changeView(bool view) {
    defaultView = view;
  }

  @action
  void setSelectedProduct(int id) {
    selectedProductId = id;
  }
}
