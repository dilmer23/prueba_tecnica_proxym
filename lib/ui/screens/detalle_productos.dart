import 'package:flutter/material.dart';
import 'package:prueba_proximate_apps/ui/common/clipReactWidget.dart';
import 'package:prueba_proximate_apps/ui/common/textWidget.dart';

class DetalleProductos extends StatelessWidget {
  final dynamic dato;
  final _characterDetailsPadding = 16.0;
  final _characterNameSize = 20.0;
  const DetalleProductos({super.key, this.dato});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.black,
        title: Text(dato.title.toString()),
      ),
      body: Padding(
        padding: EdgeInsets.all(_characterDetailsPadding),
        child: ListView(children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: _characterDetailsPadding),
            child: Column(
              children: [
                Hero(
                  tag: "image_${dato.title}",
                  child: ClipRreactCustom(dato: dato.image),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: _characterDetailsPadding),
                  child: Text(
                    dato.title.toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: _characterNameSize),
                  ),
                ),
                const SizedBox(height: 15),
                CustomText(dato: dato.shortDescription, fontSize: 12),
                const SizedBox(height: 20),
                CustomText(dato: dato.longDescription, fontSize: 25)
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
