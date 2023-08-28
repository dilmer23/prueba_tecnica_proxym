// ignore_for_file: use_build_context_synchronously
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_proximate_apps/config/providers/login.provider.dart';
import 'package:prueba_proximate_apps/domain/models/login/login.model.dart';
import 'package:prueba_proximate_apps/ui/screens/drawer_productos.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginApp extends StatefulWidget {
  const LoginApp({super.key});

  @override
  State<LoginApp> createState() => _LoginAppState();
}

class _LoginAppState extends State<LoginApp> {
  late final FocusNode markFocusNode;
  @override
  void initState() {
    // Show an alert when the app is launched
    // _showInitialAlert(context);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //hagame un provider de productos
    final providerLogin = Provider.of<LoginProviders>(context);
    final userFocus = FocusNode();
    final passFocus = FocusNode();
    bool isObscure = false;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Image.asset("lib/config/asset/logo.png"),
            const SizedBox(width: 10),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'lib/config/asset/tienda.png', // Cambia la ruta a la ubicación de tu imagen
                height: 200.0,
                width: 200.0,
              ),
              const SizedBox(height: 40.0),
              TextFormField(
                onChanged: ((value) {
                  providerLogin.setUser(value);
                }),
                focusNode: userFocus,
                autofocus: false,
                decoration: InputDecoration(
                  labelText: 'usuario',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  icon: const Icon(Icons.supervised_user_circle_outlined),
                ),
              ),
              const SizedBox(height: 40.0),
              TextFormField(
                onChanged: (value) {
                  providerLogin.setPasword(value);
                },
                obscureText: providerLogin.isObscure,
                autofocus: false,
                focusNode: passFocus,
                initialValue: "",
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(
                        providerLogin.isObscure == true
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        isObscure = !providerLogin.isObscure;
                        providerLogin.setIsObscure(isObscure);
                      },
                    ),
                    labelText: 'Contraseña',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    icon: const Icon(Icons.password),
                    iconColor: Colors.transparent),
                // controller: paswordLogin,
              ),
              const SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: () async {
                  // Obtain shared preferences.
                  final SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  // Lógica para realizar el inicio de sesión
                  String email = providerLogin.user;
                  String password = providerLogin.pasword;
                  Map<String, String> body = {
                    "user": email,
                    "password": password
                  };
                  final String? data = prefs.getString('data');

                  final bool? repeat = prefs.getBool('repeat');
                  if (repeat == true) {
                    Map<String, dynamic> jsonMap = json.decode(data!);
                    final login = loginFromJson(json.encode(jsonMap));
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DrawerHome(data: login),
                      ),
                    );
                  } else {
                    var rta = jsonEncode(body);
                    var data = await providerLogin.loginUseCase.getLogin(rta);
                    if (data.status) {
                      if (data.status == true && data.codeStatus == "0x01") {
                        Map<String, dynamic> jsonData = json.decode(data.data);
                        String serializedMap = jsonEncode(data);
                        String token = jsonData["userToken"];
                        log(token);
                        providerLogin.setToken(token);
                        await prefs.setString('data', serializedMap);
                        await prefs.setString('token', token);
                        await prefs.setBool('repeat', true);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DrawerHome(data: data),
                          ),
                        );
                      } else {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Error de Inicio de Sesión'),
                              content: const Text(
                                  'No se pudo realizar el inicio de sesión. Por favor, verifica tus credenciales.'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pop(); // Cierra el diálogo
                                  },
                                  child: const Text('Aceptar'),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    } else {
                      // Manejo del caso de error
                      log("Error en inicio de sesión");
                      Alert(
                        context: context,
                        type: AlertType.error,
                        title: "No se Pudo Ingresar",
                        desc: data.message,
                        buttons: [
                          DialogButton(
                            // ignore: sort_child_properties_last
                            child: const Text(
                              "Aceptar",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            onPressed: () => Navigator.pop(context),
                            width: 120,
                          )
                        ],
                      ).show();
                    }
                  }
                },
                child: const Text('Iniciar Sesión'),
              ),
              const SizedBox(height: 16.0),
              Image.asset(
                'lib/config/asset/logo.png', // Cambia la ruta a la ubicación de tu imagen
                height: 100.0,
                width: 100.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showInitialAlert(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Bienvenido a la Aplicación'),
          content: const Text('¡Gracias por usar nuestra app!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Closes the dialog
              },
              child: const Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }
}
