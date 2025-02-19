import 'package:get_it/get_it.dart';
import 'package:pokedexflutter/src/features/home/domain/repository/home_reposytory.dart';
import 'package:pokedexflutter/src/features/home/domain/usecase/get_pokemons/get_pokemons.dart';

class GetPokemonsImpl implements GetPokemons {
  final _repository = GetIt.instance.get<HomeRepository>();
  @override
  Future<GetPokemonResult> get() async =>
    await _repository.getPokemon();
  
}