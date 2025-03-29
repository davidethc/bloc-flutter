import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'history_location_bloc_event.dart';
part 'history_location_bloc_state.dart';

class HistoryLocationBlocBloc extends Bloc<HistoryLocationBlocEvent, HistoryLocationBlocState> {
  HistoryLocationBlocBloc() : super(const HistoryLocationBlocState()) {
    on<NewLocationEvent>(_onNewLocationEvent);
  }

  void onNewUserLocation(double latitude, double longitude) {
      

    add(NewLocationEvent((latitude, longitude)));
  }

  Future<void> _onNewLocationEvent(NewLocationEvent event, Emitter<HistoryLocationBlocState> emit) async {
    final newState = state.copyWith(positions: [...state.positions, event.position]);
    emit(newState);
  }
}
