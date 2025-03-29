import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
part 'geolocation_state.dart';

class GeolocationCubit extends Cubit<GeolocationState> {
  final void Function(double latitude, double longitude) ?onNewLocation;
  GeolocationCubit({this.onNewLocation}) : super(const GeolocationState());

  Future<void> checkStatus() async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    var permissionGranted = await Geolocator.checkPermission();


      if(permissionGranted == LocationPermission.denied){
      permissionGranted = await Geolocator.requestPermission();
    }
    emit(
      state.copyWith(
        serviceEnabled: serviceEnabled,
        permissionGranted: permissionGranted == LocationPermission.always || permissionGranted == LocationPermission.whileInUse,
      ),
    );
  }
  void watchPosition() async {
   //obtener la posicion actual del usuario
   await checkStatus();
   if (!state.permissionGranted || !state.serviceEnabled) {
    const locationSettings = LocationSettings(
      accuracy: LocationAccuracy.bestForNavigation,
      distanceFilter: 10,
    );
    Geolocator.getPositionStream(locationSettings: locationSettings).listen((position) {
      final newLocation = (position.latitude, position.longitude);
      emit(state.copyWith(position: newLocation));
    });
    return;
   }
   Geolocator.getPositionStream().listen((position) {
    emit(state.copyWith(position: (position.latitude, position.longitude)));
    onNewLocation?.call(position.latitude, position.longitude);
   });
  }
}
