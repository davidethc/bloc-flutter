part of 'invitados_bloc.dart';

enum GuestFilter{
  all,
  invited,
  notInvited
}

 class InvitadosState extends Equatable {
  final GuestFilter filter;
  final List<Todo>guests;

  const InvitadosState({ 
    this.filter=GuestFilter.all,
   this.guests=const []});
  
int get  howManyInvited => guests.length;
List<Todo> get filterGuests{
  switch(filter){
    case GuestFilter.all: return guests;
    case GuestFilter.invited: return guests.where((guest) => guest.done).toList();
    case GuestFilter.notInvited: return guests.where((guest) => !guest.done).toList();
    default: throw Exception('Filter not implemented');
  }
}
int get howManyFiltered => filterGuests.length;
  InvitadosState copyWith({
    GuestFilter? filter,
    List<Todo>? guests,
  }) => InvitadosState(
    filter: filter ?? this.filter,
    guests: guests ?? this.guests,
  );

    @override
  List<Object> get props => [filter,guests];
}


