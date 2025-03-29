part of 'history_location_bloc_bloc.dart';

abstract class HistoryLocationBlocEvent extends Equatable {
  const HistoryLocationBlocEvent();

  @override
  List<Object> get props => [];
}
class NewLocationEvent extends HistoryLocationBlocEvent {
  final (double latitude, double longitude) position;
  const NewLocationEvent(this.position);

  @override
  List<Object> get props => [position];
}
