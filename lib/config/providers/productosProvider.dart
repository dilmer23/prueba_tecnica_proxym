
import 'package:flutter/cupertino.dart';
import 'package:prueba_proximate_apps/domain/useCase/productos/productosUseCase.dart';

//injecion de dependecias ddel use case de pokemon
// cuando se inicie la aplicación  injecten el caso de uso
// se injecta en la app de configuracon de la app app.dart
class ProductoProvider extends ChangeNotifier{
  final ProductosUseCase productoUseCase;
  ProductoProvider({ required this.productoUseCase});
}