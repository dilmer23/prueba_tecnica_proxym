import 'package:prueba_proximate_apps/domain/models/productos/productos.model.dart';

abstract class ProductosGateway {
  // devuelve metodo lista de productos del modelo lista de lo obtenido de la api
  Future<List<Product>> getProductos(token);
}