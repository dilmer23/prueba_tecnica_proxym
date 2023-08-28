
import 'package:prueba_proximate_apps/domain/models/login/login.model.dart';
abstract class LoginGeteway {
  // devuelve metodo lista de productos del modelo lista de lo obtenido de la api
  Future<Login> getLogin(body);
}