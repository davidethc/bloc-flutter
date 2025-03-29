import 'package:bloc/bloc.dart';
import 'package:blocs_app/config/helpers/random_generator.dart';
import 'package:blocs_app/domain/entities/todo.dart';
import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

part 'invitados_event.dart';
part 'invitados_state.dart';

const uuid = Uuid();
class InvitadosBloc extends Bloc<InvitadosEvent, InvitadosState> {
  
  InvitadosBloc() : super( InvitadosState(
    guests  : [
      Todo(id: uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: null),
      Todo(id: uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: null),
      Todo(id: uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: DateTime.now()),
      Todo(id: uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: null),
      Todo(id: uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: DateTime.now()),
    ]
  )) {
    // on<SetInvitedFilterGuestEvent>((event, emit) {
    //   emit(state.copyWith(filter: GuestFilter.invited));
    // });
    // on<SetNotInvitedFilterGuestEvent>((event, emit) {
    //   emit(state.copyWith(filter: GuestFilter.notInvited));
    // });
    // on<SetAllFilterGuestEvent>((event, emit) {
    //   emit(state.copyWith(filter: GuestFilter.all));
    // });
    // on<SetCustomFilterGuestEvent>((event, emit) {
    //   emit(state.copyWith(filter: event.newFilter));
    // });
    on<SetCustomFilterGuestEvent>((event, emit) {
      emit(state.copyWith(filter: event.newFilter));
    });
    on<AddGuestEvent>(_addGuestHandler);
    on<ToggleGuestEvent>(_toggleGuestHandler);
  }
  void changeFilter(GuestFilter newFilter){
    // switch(newFilter){
    //   case GuestFilter.all:
    //     add(SetAllFilterGuestEvent());
    //     break;
    //   case GuestFilter.invited:
    //     add(SetInvitedFilterGuestEvent());
    //     break;
    //   case GuestFilter.notInvited:
    //     add(SetNotInvitedFilterGuestEvent());
    //     break;
    // }
    add(SetCustomFilterGuestEvent(newFilter));
  }
  void toggleGuest(String id){
    add(ToggleGuestEvent(id));
  }
  void _addGuestHandler(AddGuestEvent event, Emitter<InvitadosState> emit){
    final newGuest = Todo(id: uuid.v4(), description: event.name, completedAt: null);
    emit(state.copyWith(guests: [...state.guests, newGuest]));
  }
  void _toggleGuestHandler(ToggleGuestEvent event, Emitter<InvitadosState> emit){
    final newGuests = state.guests.map((guest) {
      if(guest.id == event.id) return guest.copyWith(completedAt: guest.completedAt == null ? DateTime.now() : null);
      return guest;
    }).toList();
    emit(state.copyWith(guests: newGuests));
  }
}
