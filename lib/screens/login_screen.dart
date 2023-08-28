import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/login_provider .dart';
import '../widgets/form_login_password.dart';


class LoginScreen extends StatefulWidget {
    static const routeName = '/login';

    const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}


class _LoginScreenState extends State<LoginScreen> {
  double deviceHeight = 0;
  double deviceWidth = 0;

  @override
  Widget build(BuildContext context) {
    SnackBarService.instance.buildContext = context;
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 101, 129, 173),
      body: Center(
        child: SingleChildScrollView(
          child: SizedBox(
            height: deviceHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                header(),
                const FormEmailPassword(mode: "login"),

                              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget header() {
    return const  Column(
      children: [
         SizedBox(
          height: 15,
        ),
         Text(
          "Pokedex Login ",
          style: TextStyle(
              color: Colors.white, fontSize: 50, fontWeight: FontWeight.w400),
        )
      ],
    );
  }


}