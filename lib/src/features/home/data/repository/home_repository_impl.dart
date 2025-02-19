import 'package:get_it/get_it.dart';
import 'package:pokedexflutter/src/features/home/data/datasource/home_datasource.dart';
import 'package:pokedexflutter/src/features/home/domain/model/pokemon_model.dart';
import 'package:pokedexflutter/src/features/home/domain/repository/home_reposytory.dart';
import 'package:pokedexflutter/src/features/home/domain/usecase/errors/home_failure.dart';
import 'package:pokedexflutter/src/features/home/domain/usecase/get_pokemons/get_pokemons.dart';
import 'package:pokedexflutter/src/features/wrapper/result/result.dart';

class HomeRepositoryImpl implements HomeRepository {
  final _datasource = GetIt.instance.get<HomeDataSource>();

  @override
  Future<GetPokemonResult> getPokemon() async{
    final result = await _datasource.getPokemons();

   return switch (result) {
       Success<Map<String, dynamic>, HomeFailure>() => Success(result.value['pokemon'].map<PokemonModel>((it) => PokemonModel.fromMap(it)).toList()),
       Failure<Map<String, dynamic>, HomeFailure>() => Failure(result.exception)
        
    };
  }
}