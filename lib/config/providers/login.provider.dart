//injecion de dependecias ddel use case de pokemon
// cuando se inicie la aplicación  injecten el caso de uso
// se injecta en la app de configuracon de la app app.dart
import 'package:flutter/material.dart';
import 'package:prueba_proximate_apps/domain/use_case/login/login_use_case.dart';

class LoginProviders extends ChangeNotifier {
  final LoginUseCase loginUseCase;
  //mantener token de secion
  String _token = "";
  //selecion de item
  int _selectedIndex = 0;
  bool _isObscure = false;
  bool _login = false;
  String _pasword = "";
  String _user = "";
  String get token => _token;
  int get selectedIndex => _selectedIndex;
  bool get isObscure => _isObscure;
  bool get login => _login;
  String get pasword => _pasword;
  String get user => _user;
  LoginProviders({required this.loginUseCase});

  void setToken(String results) {
    _token = results;
    notifyListeners();
  }
   void setSelectIndex(int results) {
    _selectedIndex = results;
    notifyListeners();
  }
  void setIsObscure(bool results) {
    _isObscure = results;
    notifyListeners();
  }
  void setLogin(bool results) {
    _login = results;
    notifyListeners();
  }
  void setPasword(String results) {
    _pasword = results;
    notifyListeners();
  }
   void setUser(String results) {
    _user = results;
    notifyListeners();
  }
}
