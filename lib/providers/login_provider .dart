import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:practica_3_julio/screens/login_screen.dart';

class LoginProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;

  User? get user => _user;

  LoginProvider() {
    _auth.authStateChanges().listen((user) {
      _user = user;
      notifyListeners();
    });
  }

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        print(value.user!.email);
        _user = value.user;
        notifyListeners();
      });
    } catch (e) {
      // Maneja errores de autenticación aquí
      print('Error al iniciar sesión: $e');
    }
  }

  Future<void> signOut(BuildContext context) async {
    await _auth.signOut().then((value) {
      _user = null; 
      Navigator.pushReplacementNamed(context, LoginScreen.routeName);
    });
    notifyListeners();
  }
}
