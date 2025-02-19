import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedexflutter/src/features/home/data/repository/home_repository_impl.dart';
import 'package:pokedexflutter/src/features/home/domain/usecase/get_pokemons/get_pokemons.dart';
import 'package:pokedexflutter/src/features/home/domain/usecase/get_pokemons/get_pokemons_impl.dart';

import '../data/datasource/home_datasource.dart';
import '../data/datasource/home_datasource_impl.dart';
import '../domain/repository/home_reposytory.dart';

homeDidSetup(GlobalKey<NavigatorState> navigator){
  GetIt.instance.registerLazySingleton<HomeDataSource>(()=> HomeDatasourceImpl());
  GetIt.instance.registerLazySingleton<HomeRepository>(()=> HomeRepositoryImpl());
  GetIt.instance.registerLazySingleton<GetPokemons>(()=> GetPokemonsImpl());
}