part of 'pokemon_bloc.dart';

abstract class PokemonEvent extends Equatable {
  const PokemonEvent();

  @override
  List<Object> get props => [];
}
class AddPokemonEvent extends PokemonEvent {
  final int id;
  final String name;

  const AddPokemonEvent(this.id, this.name);

  @override
  List<Object> get props => [id, name];
}
