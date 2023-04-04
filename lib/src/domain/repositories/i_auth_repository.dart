import 'package:loomi_flutter_boilerplate/src/external/models/access_token_model.dart';

import '../../external/models/auth_model.dart';

abstract class IAuthRepository {
  Future<void> postAuth({required AuthModel body});
  Future<AccessTokenModel> getAuthToken();
}
