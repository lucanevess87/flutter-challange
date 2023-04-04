import 'package:loomi_flutter_boilerplate/src/external/models/product_model.dart';

abstract class IMarketplaceRepository {
  Future<List<ProductModel>> getPaginationMarketplace(
      {required int page, String? search});
}
