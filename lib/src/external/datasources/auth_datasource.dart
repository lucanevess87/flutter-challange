import 'package:dio/dio.dart';
import 'package:loomi_flutter_boilerplate/src/external/models/access_token_model.dart';
import 'package:retrofit/retrofit.dart';
import '../../domain/repositories/i_auth_repository.dart';
import '../models/auth_model.dart';

part "auth_datasource.g.dart";

@RestApi()
abstract class AuthDataSource implements IAuthRepository {
  factory AuthDataSource(Dio dio, {String baseUrl}) = _AuthDataSource;

  @override
  @GET("login")
  Future<AccessTokenModel> getAuthToken();

  @override
  @POST("login")
  Future<void> postAuth({
    @Path("body") required AuthModel body,
  });
}
