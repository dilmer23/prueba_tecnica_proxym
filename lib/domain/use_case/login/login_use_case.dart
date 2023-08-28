import 'package:prueba_proximate_apps/domain/models/login/geteway/login_geteway.dart';
import 'package:prueba_proximate_apps/domain/models/login/login.model.dart';

class LoginUseCase {
  final LoginGeteway _loginGeteway;
  //contrcutor donde pida la entreda de
  LoginUseCase(this._loginGeteway);
  Future<Login> getLogin(body) {
    return _loginGeteway.getLogin(body);
  }
}
