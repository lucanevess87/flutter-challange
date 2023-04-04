import 'package:dio/dio.dart';
import 'package:loomi_flutter_boilerplate/src/domain/repositories/i_marketplace_repository.dart';
import 'package:loomi_flutter_boilerplate/src/external/models/product_model.dart';
import 'package:retrofit/retrofit.dart';

part "marketplace_datasource.g.dart";

@RestApi()
abstract class MarketplaceDataSource implements IMarketplaceRepository {
  factory MarketplaceDataSource(Dio dio, {String baseUrl}) =
      _MarketplaceDataSource;

  @override
  @GET("paint?page={page}&limit=10&search={search}")
  Future<List<ProductModel>> getPaginationMarketplace({
    @Path("page") required int page,
    @Path("search") String? search,
  });
}
