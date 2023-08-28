// ignore_for_file: file_names
import 'package:flutter/material.dart';

class ClipRreactCustom extends StatelessWidget {
  final dynamic dato;

  const ClipRreactCustom({super.key, required this.dato});

  @override
  Widget build(BuildContext context) {
    double anchoMaximo =
        MediaQuery.of(context).size.width * 0.9; // 90% del ancho de la pantalla
    double altoMaximo = MediaQuery.of(context).size.height *
        0.4; // 40% del ancho de la pantalla
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(10.0),
        bottomLeft: Radius.circular(10.0),
        bottomRight: Radius.circular(10.0),
        topRight: Radius.circular(10.0),
      ),
      child: Image.network(dato,
          height: altoMaximo,
          width: anchoMaximo,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) =>
              Image.asset("lib/config/asset/logo.png")),
    );
  }
}
