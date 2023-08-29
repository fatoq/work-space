import 'package:flutter/material.dart';
import 'package:practica_3_julio/main.dart';
import 'package:provider/provider.dart';
import '../providers/login_provider .dart';


class LoginScreen extends StatelessWidget {
  static const routeName = '/login';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);

    final TextEditingController _emailController = TextEditingController(text: '');
    final TextEditingController _passwordController = TextEditingController(text: '');

    return Scaffold(
      appBar: AppBar(
        title:const Text('Iniciar Sesión'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[header(),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Usuario (correo electrónico)',
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Contraseña',
              ),
              obscureText: true,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                final email = _emailController.text;
                final password = _passwordController.text;

                if (email.isNotEmpty && password.isNotEmpty) {
                  try {
                    await loginProvider.signInWithEmailAndPassword(email, password);
                    if (loginProvider.user != null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                       const SnackBar(
                          content: Text('Acceso Concedido'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                      Navigator.of(context).pushReplacementNamed(MainWidget.routeName);

                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                      const  SnackBar(
                          content: Text('Error al iniciar sesión. Verifica tus credenciales.'),
                        ),
                      );
                    }
                  } catch (e) {
                    print('Error al iniciar sesión: $e');
                    ScaffoldMessenger.of(context).showSnackBar(
                     const SnackBar(
                        content: Text('Error al iniciar sesión. Verifica tus credenciales.'),
                      ),
                    );
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                   const SnackBar(
                      content: Text('Por favor, completa todos los campos.'),
                    ),
                  );
                }
              },
              child: const Text('Iniciar Sesión'),
            ),
          ],
        ),
      ),
    );
  }
}
  Widget header() {
    return const Column(
      children: [
         SizedBox(
          height: 15,
        ),
         Text(
          "POKEDEX",
          style: TextStyle(
              color: Color.fromARGB(255, 247, 230, 0), fontSize: 75,
               fontWeight: FontWeight.w600),
        )
      ],
    );
  }
