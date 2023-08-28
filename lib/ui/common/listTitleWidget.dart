// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:prueba_proximate_apps/ui/common/textWidget.dart';

class ListTitleCustom extends StatelessWidget {
  final String title;
  final Icon icono;
  final dynamic widget;
  const ListTitleCustom(
      {super.key,
      required this.title,
      required this.icono,
      required this.widget});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icono,
      title: CustomText(dato: title, fontSize: 12),
      onTap: () {
        // Navigator.of(context)
        //     .pushReplacement(MaterialPageRoute(builder: (context) => widget));
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => widget,
          ),
        );
      },
    );
  }
}
