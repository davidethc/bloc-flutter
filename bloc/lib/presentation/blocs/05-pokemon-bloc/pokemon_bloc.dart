import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final Future <String> Function(int id) _getFetchPokemonName;

  PokemonBloc({required Future <String> Function(int id) fetchPokemon
  }) : _getFetchPokemonName = fetchPokemon, 
  super(const PokemonState()){

    on<AddPokemonEvent>((event,emit){
      final newPokemons = Map<int,String>.from(state.pokemons);

      newPokemons[event.id] = event.name;
      emit(state.copyWith(pokemons: newPokemons));
     
    });

}

      Future< String> fetchPokemon(int id) async {
    if(state.pokemons.containsKey(id)){
      return state.pokemons[id]!;
    }
   try {
  final pokemonName = await _getFetchPokemonName(id);
  add(AddPokemonEvent(id,pokemonName));
  return pokemonName;

   } catch (e) {
 throw Exception('Failed to fetch pokemon');
   }
  }

}