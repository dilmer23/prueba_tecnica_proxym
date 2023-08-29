import 'dart:convert';
import 'package:prueba_proximate_apps/config/const/constantes.dart';
import 'package:prueba_proximate_apps/data/erros/productos_api_error.dart';
import 'package:prueba_proximate_apps/domain/models/login/geteway/login_geteway.dart';
import 'package:prueba_proximate_apps/domain/models/login/login.model.dart';
import 'package:http/http.dart' as http;

class LoginApi extends LoginGeteway {
  @override
  Future<Login> getLogin(body) async {
    Uri url = Uri.parse("${Constantes.api}/login");
    

    final response = await http.post(url, headers: Constantes.header, body: body);
    if (response.statusCode >= 200 && response.statusCode <= 202) {
      Map<String, dynamic> jsonMap = json.decode(response.body);
      jsonMap.addAll({"count": 0});
      final productos = loginFromJson(json.encode(jsonMap));
      final productosDetalle = productos;
      return productosDetalle;
    } else {
      throw ProductoError();
    }
  }
}
