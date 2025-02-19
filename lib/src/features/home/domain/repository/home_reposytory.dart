import '../usecase/get_pokemons/get_pokemons.dart';

abstract interface class HomeRepository {
  Future<GetPokemonResult> getPokemon();
}