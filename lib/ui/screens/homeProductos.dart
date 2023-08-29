import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_proximate_apps/config/providers/loginProvider.dart';
import 'package:prueba_proximate_apps/config/providers/productosProvider.dart';
import 'package:prueba_proximate_apps/domain/models/productos/productos.model.dart';
import 'package:prueba_proximate_apps/ui/common/circularProgressWidget.dart';
import 'package:prueba_proximate_apps/ui/common/clipReactWidget.dart';
import 'package:prueba_proximate_apps/ui/common/textWidget.dart';
import 'package:prueba_proximate_apps/ui/screens/detalleProductos.dart';

class HomeProductos extends StatefulWidget {
  const HomeProductos({Key? key}) : super(key: key);

  @override
  State<HomeProductos> createState() => _HomeProductosState();
}

class _HomeProductosState extends State<HomeProductos> {
  @override
  Widget build(BuildContext context) {
    //hagame un provider de productos
    final providerProductos = Provider.of<ProductoProvider>(context);
    final providerLogin = Provider.of<LoginProviders>(context);
    return Drawer(
      child: Scaffold(
          appBar: AppBar(
            title: Row(
              children: <Widget>[
                Image.asset("lib/config/asset/tienda.png",
                height: 80,
                width: 80,),
                const SizedBox(width: 10),
                const CustomText(dato: "Productos", fontSize: 20)
              ],
            ),
          ),
          body: FutureBuilder<List<Product>>(
            future: providerProductos.productoUseCase
                .getAllProductos(providerLogin.token),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CargandoCustom(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text("${snapshot.error}"),
                );
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(
                  child: Text("No hay datos disponibles."),
                );
              } else {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    Product productosDetalle = snapshot.data![index];
                    return InkWell(
                      hoverColor: Colors.amber,
                      onTap: (() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DetalleProductos(dato: productosDetalle),
                          ),
                        );
                      }),
                      child: Card(
                        elevation: 10,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                    width: 150,
                                    height: 150,
                                    child: Hero(
                                      tag: "image_${productosDetalle.title}",
                                      child: ClipRreactCustom(
                                          dato: productosDetalle.image),
                                    )),
                                const SizedBox(width: 30),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: <Widget>[
                                          const SizedBox(width: 10),
                                          Container(
                                              padding: const EdgeInsets.all(
                                                  16.0), // Espaciado interno
                                              child: CustomText(
                                                // custom widget text
                                                dato: productosDetalle.title,
                                                fontSize: 18,
                                              ))
                                        ],
                                      ),
                                      const SizedBox(height: 15),
                                      Container(
                                        padding: const EdgeInsets.all(
                                            16.0), // Espaciado interno
                                        child: CustomText(
                                          // custom widget text
                                          dato: productosDetalle.shortDescription,
                                          fontSize: 15,
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
            },
          )),
    );
  }
}
