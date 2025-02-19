abstract interface class HomeFailure implements Exception {}

class HomeDataSourceErros implements HomeFailure {
  final String code;
  HomeDataSourceErros(this.code);
}

class HomeEmptyListErrors implements HomeFailure {}

class HomeUnknowErrors implements HomeFailure {}
