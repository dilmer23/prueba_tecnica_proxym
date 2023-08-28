import 'dart:convert';
import 'package:prueba_proximate_apps/data/driver_adapter/erros/productos_api_error.dart';
import 'package:prueba_proximate_apps/domain/models/login/geteway/login_geteway.dart';
import 'package:prueba_proximate_apps/domain/models/login/login.model.dart';
import 'package:http/http.dart' as http;

class LoginApi extends LoginGeteway {
  @override
  Future<Login> getLogin(body) async {
    Uri url = Uri.parse(
        "https://serveless.proximateapps-services.com.mx/proximatetools/dev/webadmin/testproximate/login");
    Map<String, String> headers = {
      "charset": "utf-8",
      "Accept-Charset": "utf-8",
      'Authorization': "xYzqNrv8CYYUd3dv",
      'Content-type': 'application/json'
    };
    // String data = json.encode({"userToken": "xYzqNrv8CYYUd3dv"});

    final response = await http.post(url, headers: headers, body: body);
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
