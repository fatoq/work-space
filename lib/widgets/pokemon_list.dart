import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:practica_3_julio/providers/pokemon_provider.dart';
import 'package:practica_3_julio/screens/pokemon_details.dart';
import 'package:practica_3_julio/widgets/pokemon_favorite.dart';
import 'package:practica_3_julio/widgets/pokemon_list_items.dart';
import 'package:provider/provider.dart';


class PokemonList extends StatefulWidget {
  const PokemonList({super.key});

  @override
  State<PokemonList> createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<PokemonProvider>(builder: (context, provider, child) {
      return PokemonListItems(pokemons: provider.pokemons);
    });
  }
}
