import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pokedexflutter/src/features/home/presenter/components/pokemon_item_list.dart';
import 'package:pokedexflutter/src/features/home/presenter/viewModel/home_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
 final HomeViewModel _homeViewModel = HomeViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokedex'),
      ),
      body: SafeArea(
        child: ListenableBuilder(
          listenable: _homeViewModel.load,
          builder: (context, child) {
            if (_homeViewModel.load.running) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (_homeViewModel.load.error) {
              return Center(
                child: Column(
                  children: [
                    Text(
                        'Não foi possível buscar a lista por favor exxecute novamente!'),
                    ElevatedButton(
                        onPressed: _homeViewModel.load.execute,
                        child: Text("Denovo!")),
                  ],
                ),
              );
            }
            return child!;
          },
          child: _pokemonsList(),
        ),
      ),
    );
  }

  _pokemonsList() => Padding(
     padding: EdgeInsets.symmetric(horizontal: 16),
    child: Column(
       mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Pokemons', style: TextStyle(fontSize: 20),),
            SizedBox(height: 16,),
            
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                   mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 4,
                  children: List.generate(
                    _homeViewModel.listPokemon.length,
                    (index) => PokemonItemList(
                      name: _homeViewModel.listPokemon[index].name,
                      url: _homeViewModel.listPokemon[index].url,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
  );
}
