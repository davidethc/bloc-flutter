part of 'invitados_bloc.dart';

abstract class InvitadosEvent extends Equatable {
  const InvitadosEvent();

  @override
  List<Object> get props => [];
}
final class SetAllFilterGuestEvent extends InvitadosEvent{}
final class SetInvitedFilterGuestEvent extends InvitadosEvent{}
final class SetNotInvitedFilterGuestEvent extends InvitadosEvent{}

final class SetCustomFilterGuestEvent extends InvitadosEvent{
  final GuestFilter newFilter;
  const SetCustomFilterGuestEvent(this.newFilter);
}
final class  AddGuestEvent extends InvitadosEvent{
  final String name;
  const AddGuestEvent(this.name);
}
final class  ToggleGuestEvent extends InvitadosEvent{
  final String id;
  const ToggleGuestEvent(this.id);
} 

