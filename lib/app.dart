import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_proximate_apps/config/providers/login.provider.dart';
import 'package:prueba_proximate_apps/config/providers/productos.provider.dart';
import 'package:prueba_proximate_apps/config/routes/app_routes.dart';
import 'package:prueba_proximate_apps/config/theme/theme_app.dart';
import 'package:prueba_proximate_apps/data/driver_adapter/login_api.dart';
import 'package:prueba_proximate_apps/data/driver_adapter/productos_api.dart';
import 'package:prueba_proximate_apps/domain/use_case/login/login_use_case.dart';
import 'package:prueba_proximate_apps/domain/use_case/productos/productos_use_case.dart';
import 'package:prueba_proximate_apps/ui/screens/home_productos.dart';
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
