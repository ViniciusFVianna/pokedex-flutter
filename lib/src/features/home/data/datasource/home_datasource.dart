import 'package:pokedexflutter/src/features/wrapper/result/result.dart';

import '../../domain/usecase/errors/home_failure.dart';

typedef HomeDatesourceResult = Result<Map<String, dynamic>, HomeFailure>;

abstract interface class HomeDataSource {
Future<HomeDatesourceResult> getPokemons(); 
  
}