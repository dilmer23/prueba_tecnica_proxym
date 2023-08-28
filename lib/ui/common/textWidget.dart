// ignore_for_file: file_names
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final dynamic dato;
  final double fontSize;
  const CustomText({super.key, required this.dato, required this.fontSize});
  @override
  Widget build(BuildContext context) {
    return Text(
      dato,
      maxLines: 7,
      overflow: TextOverflow.visible,
      style: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: fontSize,
      ),
      textAlign: TextAlign.justify,
    );
  }
}
