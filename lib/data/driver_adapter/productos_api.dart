import 'dart:convert';
import 'package:prueba_proximate_apps/config/const/constantes.dart';
import 'package:prueba_proximate_apps/data/driver_adapter/erros/productos_api_error.dart';
import 'package:prueba_proximate_apps/domain/models/productos/geteway/productos_geteway.dart';
import 'package:prueba_proximate_apps/domain/models/productos/productos.model.dart';
import 'package:http/http.dart' as http;

class ProductosApi extends ProductosGateway {
  @override
  Future<List<Product>> getProductos(token) async {
    Uri url = Uri.parse("${Constantes.api}/getproducts");

    String data = json.encode({"userToken": "$token"});
    Map<String, String> headers = Constantes.header;
    final response = await http.post(url, headers: headers, body: data);
    if (response.statusCode >= 200 && response.statusCode <= 202) {
      final decodedResp = json.decode(utf8.decode(response.bodyBytes));
      String dataString = decodedResp['data'];
      final productos = productosFromJson(dataString);
      final productosDetalle = productos.products;
      return productosDetalle;
    } else {
      throw ProductoError();
    }
  }
}
