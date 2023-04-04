import 'package:get_it/get_it.dart';
import 'package:loomi_flutter_boilerplate/src/domain/repositories/i_auth_repository.dart';
import 'package:loomi_flutter_boilerplate/src/external/models/access_token_model.dart';
import 'package:mobx/mobx.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase with Store {
  @observable
  bool loading = false;

  @observable
  String login = "";

  @observable
  String password = "";

  @observable
  String accessTokenStorage = "";

  @action
  Future<AccessTokenModel> getAuthToken() async {
    var token = await GetIt.I.get<IAuthRepository>().getAuthToken();
    return token;
  }

  @action
  Future<dynamic> loginFn(user) async {
    var userResponse =
        await GetIt.I.get<IAuthRepository>().postAuth(body: user);
    return userResponse;
  }
}
