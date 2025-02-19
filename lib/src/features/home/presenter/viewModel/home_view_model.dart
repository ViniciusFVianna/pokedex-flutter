// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'package:pokedexflutter/src/features/home/domain/model/pokemon_model.dart';
import 'package:pokedexflutter/src/features/home/domain/usecase/get_pokemons/get_pokemons.dart';
import 'package:pokedexflutter/src/features/wrapper/command/command.dart';

import '../../../wrapper/result/result.dart';
import '../../domain/usecase/errors/home_failure.dart';

class HomeViewModel extends ChangeNotifier {
  final _getPokemons = GetIt.instance.get<GetPokemons>();

  HomeViewModel(){
    load = HomeCommand(_load)..execute();
  }

  late HomeCommand load;

   List<PokemonModel> _listPokemon = [];
  List<PokemonModel> get listPokemon => _listPokemon;

  Future<GetPokemonResult> _load() async {
    try {
      final result = await _getPokemons.get();

      switch (result) {
        case Success<List<PokemonModel>, HomeFailure>():
          _listPokemon = result.value;
        case Failure<List<PokemonModel>, HomeFailure>():
          AlertDialog(
            title: Text(
              'Alerta!!!',
            ),
            content: Text(
              result.exception.toString(),
            ),
          );
          
      }
      return result;
    } finally {
      notifyListeners();
    }
  }
}
