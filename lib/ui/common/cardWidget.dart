// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CardCustom extends StatelessWidget {
  final Icon icono;
  final String dato;
  final dynamic widget;
  const CardCustom(
      {super.key,
      required this.dato,
      required this.icono,
      required this.widget});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => widget,
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              icono,
              const SizedBox(
                height: 50,
                width: 100,
              ),
              Text(
                dato,
                style: const TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
