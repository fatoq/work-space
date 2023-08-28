import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:practica_3_julio/main.dart';
import 'package:http/http.dart' as http;

import '../screens/login_screen.dart';


enum AuthSta {  notAuthenticated,authenticated,userNotFound, authenticating}
class AuthProvider  extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? user;
  AuthSta? status;
  AuthProvider () {checkCurrentUserIsAuthenticated();}

  Future<void> authLogin() async {
    if (user != null) {Navigation.instance.navigateToReplacementName(MainWidget.routeName);}
  }
  void checkCurrentUserIsAuthenticated() async {
    user =  _auth.currentUser;
    if (user != null) {
      status = AuthSta.authenticated;
      notifyListeners();
      await authLogin();
    }
  }
  Future<void> loginWithEmailAndPassword(
      BuildContext context, String email, String password) async {
            status = AuthSta.authenticating;

    notifyListeners();
    try {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((result) {
        user = result.user;
        status = AuthSta.authenticated;
        notifyListeners();
        SnackBarService.instance.showSn("Bienvenido ${result.user!.email}", true);
        Navigator.pushReplacementNamed(context, MainWidget.routeName);
      });
    } catch (e) {
      notifyListeners();
      user = null;
      SnackBarService.instance.showSn("Error al autenticar", false);
    }
  }

  Future<void> registerWithEmailAndPassword(
      BuildContext context, String email, String password) async {
    notifyListeners();
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((result) {
        user = result.user;
        status = AuthSta.authenticated;
        notifyListeners();
        SnackBarService.instance.showSn(
            "Usuario ${result.user!.email} ha sido Registrado con exito, puede Inicia sesión",true);
        Navigator.pop(context);
      });
    } catch (e) {
      notifyListeners();
      user = null;
      SnackBarService.instance.showSn("Error al registrarse", false);
    }
  }

  Future<void> logoutUser() async {
    try {
      await _auth.signOut().then((_) {
        status = AuthSta.notAuthenticated;
        user = null;
        Navigation.instance
            .navigateToReplacementName(LoginScreen.routeName);
      });
    } catch (e) {
      SnackBarService.instance.showSn("Error al cerrar sesión", false);
    }
    notifyListeners();
  }
}

class Navigation {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static Navigation instance = Navigation();

  Future<void> navigateToReplacementName(String routeName) {
    return navigatorKey.currentState!.pushReplacementNamed(routeName);
  }
  
}
class SnackBarService {
  BuildContext? _buildContext;
  static SnackBarService instance = SnackBarService();
  SnackBarService();
  set buildContext(BuildContext context) {
    _buildContext = context;
  }
  void showSn(String message, bool success) {
    ScaffoldMessenger.of(_buildContext!).showSnackBar(
      SnackBar(
          duration: const Duration(seconds: 3),
          content: Text(
            message,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 15,
            ),
          ),
          backgroundColor: success ? Colors.lightBlue : Colors.redAccent),
    );
  }
}