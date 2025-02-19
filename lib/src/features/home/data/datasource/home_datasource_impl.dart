import 'package:get_it/get_it.dart';
import 'package:pokedexflutter/src/features/home/domain/usecase/errors/home_failure.dart';
import 'package:pokedexflutter/src/features/wrapper/result/result.dart';

import '../../../wrapper/http/custom_client_http.dart';
import '../../../wrapper/http/uri_utils.dart';
import 'home_datasource.dart';

class HomeDatasourceImpl implements HomeDataSource {

  final _clientHttp = GetIt.instance.get<CustomClientHttp>();

  @override
  Future<HomeDatesourceResult> getPokemons() async {
   Uri url = UriUtils.pokemonUrl;

   final response = await _clientHttp.get(url);

   try{
    if(response.statusCode != 200) return Failure(HomeEmptyListErrors());

return  Success(response.body);
   }catch(e){
    return Failure(HomeDataSourceErros(e.toString()));
   }

  }
}