import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_proximate_apps/config/providers/loginProvider.dart';
import 'package:prueba_proximate_apps/config/providers/productosProvider.dart';
import 'package:prueba_proximate_apps/config/routes/appRoutes.dart';
import 'package:prueba_proximate_apps/config/theme/theme_app.dart';
import 'package:prueba_proximate_apps/data/driver_adapter/loginApi.dart';
import 'package:prueba_proximate_apps/data/driver_adapter/productosApi.dart';
import 'package:prueba_proximate_apps/domain/useCase/login/loginUseCase.dart';
import 'package:prueba_proximate_apps/domain/useCase/productos/productosUseCase.dart';
import 'package:prueba_proximate_apps/ui/screens/homeProductos.dart';
import 'package:prueba_proximate_apps/ui/screens/login_productos.dart';

class AppProductos extends StatelessWidget {
  const AppProductos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // CREAR el caso de uso de productos
        ChangeNotifierProvider(
            create: ((context) => ProductoProvider(
                productoUseCase: ProductosUseCase(ProductosApi())))),

        // CREAR el caso de uso de login
        ChangeNotifierProvider(
            create: ((context) =>
                LoginProviders(loginUseCase: LoginUseCase(LoginApi()))))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        home: const LoginApp(),
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case (AppRoutes.home):
              return MaterialPageRoute(
                  builder: (currentContex) => const HomeProductos());
            case (AppRoutes.drawer):
              return MaterialPageRoute(
                  builder: (currentContex) => const HomeProductos());
            default:
              return MaterialPageRoute(builder: (currentContex) => const LoginApp());
          }
        },
      ),
    );
  }
}
