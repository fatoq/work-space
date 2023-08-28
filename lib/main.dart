import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:practica_3_julio/providers/category_provider.dart';
import 'package:practica_3_julio/providers/login_provider%20.dart';
import 'package:practica_3_julio/providers/pokemon_provider.dart';
import 'package:practica_3_julio/screens/login_screen.dart';
import 'package:practica_3_julio/screens/pokemon_details.dart';
import 'package:practica_3_julio/screens/pokemon_favorite_list.dart';
import 'package:practica_3_julio/screens/pokemon_screen.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'screens/category_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized(); // se ejecuta cuando la app esta inicializada 
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );                 //para q inicializa al app con firebase
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => CategoryProvider()),
          ChangeNotifierProvider(create: (context) => PokemonProvider()),
          ChangeNotifierProvider(create: (context) => AuthProvider()),

        ],
        child: MaterialApp(
          title: 'Pokedex',
        //  home: new MainWidget(),
          initialRoute: LoginScreen.routeName,

          routes: {
            MainWidget.routeName: (context) => const MainWidget(),
            PokemonDetailsScreen.routeName: (context) => const
            PokemonDetailsScreen(),
                      LoginScreen.routeName: (context) => const LoginScreen(),

          },
        ));
  }
}



class MainWidget extends StatefulWidget {
  static const routeName = '/Home';

  const MainWidget({super.key});

  @override
  State<MainWidget> createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  int _selectedIndex = 0;

  final List<Widget> _mainWidgets = const [
    CategoryScreen(),
    PokemonScreenWidget(),
    PokemonFavoriteListScreen(),
    LoginScreen()
  ];

  void _onTapItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _mainWidgets[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categorias',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.details),
            label: 'Pokemons',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favoritos',
          )
        ],
        currentIndex: _selectedIndex,
        onTap: _onTapItem,
      ),
    );
  }
}