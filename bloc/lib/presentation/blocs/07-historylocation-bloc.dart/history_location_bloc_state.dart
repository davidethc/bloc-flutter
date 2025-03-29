part of 'history_location_bloc_bloc.dart';

 class HistoryLocationBlocState extends Equatable {
  final List<(double latitude, double longitude)> positions;
  const HistoryLocationBlocState({

    this.positions = const [],
  });
  int get howManyPositions => positions.length;
  
  HistoryLocationBlocState copyWith({
    List<(double latitude, double longitude)>? positions,
  }) {
    return HistoryLocationBlocState(
      positions: positions ?? this.positions,
    );
  }
  
  @override
  List<Object> get props => [positions];
}

