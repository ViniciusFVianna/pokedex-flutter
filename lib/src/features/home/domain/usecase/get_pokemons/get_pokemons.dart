import 'package:pokedexflutter/src/features/home/domain/model/pokemon_model.dart';
import 'package:pokedexflutter/src/features/home/domain/usecase/errors/home_failure.dart';
import 'package:pokedexflutter/src/features/wrapper/result/result.dart';

typedef GetPokemonResult = Result<List<PokemonModel>, HomeFailure>;

abstract interface class GetPokemons {
  Future<GetPokemonResult> get();
}

