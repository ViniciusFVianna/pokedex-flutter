
class UriUtils {
static final String _baseUrl = 'https://pokeapi.co/api/v2';
static final String _pokemonUrl = '$_baseUrl/pokemon';
static final String _pokemonUrl2 = 'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json';

  static Uri clientUrl(String uri) => Uri.parse(uri);

  static Uri get pokemonUrl => Uri.parse(_pokemonUrl2);
}
