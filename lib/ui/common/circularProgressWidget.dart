// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CargandoCustom extends StatelessWidget {
  const CargandoCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors
          .transparent, // Fondo transparente para ocupar todo el ancho y alto disponible
      child: Align(
        alignment: Alignment
            .center, // Posiciona el contenido en el centro de la pantalla
        child: Column(
          mainAxisSize:
              MainAxisSize.min, // Ajusta el tamaño de la columna al contenido
          children: <Widget>[
            Image.asset("lib/config/asset/logo.png"),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Cargando...",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            const CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}
