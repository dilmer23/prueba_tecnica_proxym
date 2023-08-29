import 'package:flutter/material.dart';
import 'package:prueba_proximate_apps/ui/common/buildInformationWidget.dart';
import 'package:prueba_proximate_apps/ui/common/textWidget.dart';

class DetalleUser extends StatelessWidget {
  final characterDetailsPadding = 16.0;
  final _characterNameSize = 20.0;
  final Map<String, dynamic> dato;
  const DetalleUser({super.key, required this.dato});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Image.asset(
              "lib/config/asset/tienda.png",
              height: 80,
              width: 80,
            ),
            const CustomText(dato: "user", fontSize: 20),
            const SizedBox(width: 10),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("lib/config/asset/tienda.png"),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: characterDetailsPadding),
              child: Text(
                "USER",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: _characterNameSize,
                ),
              ),
            ),
            BuildInformationWidget(
              icon: Icons.notification_important_rounded,
              dato: "NOMBRE",
              valor: dato["name"].toString(),
            ),
            BuildInformationWidget(
              icon: Icons.roller_shades,
              dato: "ROL",
              valor: dato["role"].toString(),
            ),
            BuildInformationWidget(
              icon: Icons.numbers,
              dato: "LAST NAME",
              valor: dato["lastName"].toString(),
            ),
            BuildInformationWidget(
              icon: Icons.post_add_outlined,
              dato: "POSITION",
              valor: dato["position"].toString(),
            ),
          ],
        ),
      ),
    );
  }
}
