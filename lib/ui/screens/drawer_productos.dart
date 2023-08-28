import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:prueba_proximate_apps/domain/models/login/login.model.dart';
import 'package:prueba_proximate_apps/ui/common/cardWidget.dart';
import 'package:prueba_proximate_apps/ui/common/textWidget.dart';
import 'package:prueba_proximate_apps/ui/screens/detalle_user.dart';
import 'package:prueba_proximate_apps/ui/screens/home_productos.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../common/listTitleWidget.dart';

class DrawerHome extends StatelessWidget {
  final dynamic data;
  const DrawerHome({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> jsonData = json.decode(data.data);
    return WillPopScope(
        child: Scaffold(
          appBar: AppBar(
            title: Row(
              children: <Widget>[
                Image.asset(
                  "lib/config/asset/tienda.png",
                  height: 80,
                  width: 80,
                ),
                const CustomText(dato: "HOME PRODUCTOS", fontSize: 20),
                const SizedBox(width: 50),
                IconButton(
                    onPressed: () {
                      _onBackPressed(context);
                    },
                    icon: const Icon(Icons.highlight_off_rounded))
              ],
            ),
          ),
          //cotenido de la pantalla principal
          body: Center(
              child: Row(
            children: [
              const CardCustom(
                dato: 'PRODUCTOS',
                icono: Icon(Icons.production_quantity_limits_sharp),
                widget: HomeProductos(),
              ),
              CardCustom(
                dato: 'USER',
                icono: const Icon(Icons.accessibility_new_sharp),
                widget: DetalleUser(dato: jsonData),
              )
            ],
          )),
          drawer: Drawer(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  //header
                  Container(
                    color: Colors.amber,
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).padding.top),
                    child: Column(
                      children: [
                        const CircleAvatar(
                          radius: 100,
                          backgroundColor: Colors.amber,
                          backgroundImage:
                              AssetImage("lib/config/asset/tienda.png"),
                        ),
                        CustomText(
                            dato: jsonData["lastName"].toString(),
                            fontSize: 30),
                        CustomText(
                            dato: jsonData["position"].toString(),
                            fontSize: 20),
                        CustomText(
                            dato: jsonData["role"].toString(), fontSize: 10)
                      ],
                    ),
                  ),
                  //opciones de drawer
                  Container(
                    padding: const EdgeInsets.all(24),
                    child: Wrap(
                      runSpacing: 16,
                      children: [
                        ListTitleCustom(
                          icono: const Icon(Icons.home),
                          title: 'Home',
                          widget: DrawerHome(
                            data: data,
                          ),
                        ),
                        const ListTitleCustom(
                            icono: Icon(Icons.production_quantity_limits_sharp),
                            title: 'PRODUCTOS',
                            widget: HomeProductos()),
                        const Divider(
                          color: Colors.black45,
                        ),
                        ListTitleCustom(
                            icono: const Icon(Icons.supervised_user_circle),
                            title: 'USER',
                            widget: DetalleUser(dato: jsonData)),
                      ],
                    ),
                  ),
                  //footer
                  const SizedBox(height: 120),
                  Container(
                    padding: const EdgeInsets.all(24),
                    color: Colors.grey[300],
                    child: Column(
                      children: <Widget>[
                        Column(
                          children: const [
                            Icon(Icons.facebook),
                            SizedBox(width: 40.0),
                            CustomText(dato: "Facebook", fontSize: 20)
                          ],
                        ),
                        const Divider(
                          color: Colors.black26,
                        ),
                        const CustomText(dato: "Productos Prueba", fontSize: 15)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        onWillPop: () => _onBackPressed(context));
  }

  Future<bool> _onBackPressed(BuildContext context) async {
    return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Salir o cerrar'),
            content: const Text(
                '¿Deseas abandonar esta pantalla? al cerrar perderas los datos de la sesión'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('No'),
              ),
              TextButton(
                onPressed: () async {
                  // Obtain shared preferences.
                  final SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  // Remove data for the 'counter' key.
                  await prefs.remove('repeat');
                  // ignore: use_build_context_synchronously
                  Navigator.pushNamedAndRemoveUntil(
                      context, "login", (route) => false);
                },
                child: const Text('Sí'),
              ),
            ],
          ),
        ) ??
        false;
  }
}
