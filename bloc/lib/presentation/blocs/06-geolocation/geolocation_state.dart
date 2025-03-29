part of 'geolocation_cubit.dart';

 class GeolocationState extends Equatable {
  final (double lat,double lng) position;
  final bool serviceEnabled;
  final bool permissionGranted;
  const GeolocationState({this.position=(0,0),this.serviceEnabled=false,this.permissionGranted=false});
  GeolocationState copyWith({
    (double lat,double lng)? position,
    bool? serviceEnabled,
    bool? permissionGranted
  }){
    return GeolocationState(position: position ?? this.position,
    serviceEnabled: serviceEnabled ?? this.serviceEnabled,
    permissionGranted: permissionGranted ?? this.permissionGranted);
  }

  @override
  List<Object> get props => [position,serviceEnabled,permissionGranted  ];
}
