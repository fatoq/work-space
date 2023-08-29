import 'package:flutter/material.dart';
import 'package:practica_3_julio/providers/login_provider%20.dart';
import 'package:provider/provider.dart';

class Logout extends StatelessWidget {
  const Logout({super.key});
  static const routeName = '/logout';

  @override
  Widget build(BuildContext context) {
      //  LoginProvider log = Provider.of<LoginProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('logout')),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [ //Text( log.user!.email.toString(),),
              ElevatedButton(
        onPressed: () {
              Provider.of<LoginProvider>(context,listen: false).signOut(context);
        },
        child: const Text('Logout'),
      ),
            ],
          )),
    );
  }
}
