import 'package:prueba_proximate_apps/domain/models/productos/geteway/productos_geteway.dart';
import 'package:prueba_proximate_apps/domain/models/productos/productos.model.dart';

class ProductosUseCase {
  final ProductosGateway _productosGateway;
  //contrcutor donde pida la entreda de
  ProductosUseCase(this._productosGateway);
  Future<List<Product>> getAllProductos(token) {
    return _productosGateway.getProductos(token);
  }
}
