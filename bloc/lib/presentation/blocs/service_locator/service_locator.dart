import 'package:blocs_app/config/helpers/pokemon_information.dart';
import 'package:blocs_app/config/router/app_router.dart';
import 'package:blocs_app/presentation/blocs/04-bloc/invitados_bloc.dart';
import 'package:blocs_app/presentation/blocs/01simple_cubit/username_cubit.dart';
import 'package:blocs_app/presentation/blocs/02-couenter/counter_cubit.dart';
import 'package:blocs_app/presentation/blocs/03-cubit/theme_cubit.dart';
import 'package:blocs_app/presentation/blocs/05-pokemon-bloc/pokemon_bloc.dart';
import 'package:blocs_app/presentation/blocs/06-geolocation/geolocation_cubit.dart';
import 'package:blocs_app/presentation/blocs/07-historylocation-bloc.dart/history_location_bloc_bloc.dart';
import 'package:get_it/get_it.dart';
  GetIt getIt=GetIt.instance;

void serviceLocator(){



  getIt.registerSingleton(UsernameCubit());
  getIt.registerSingleton(RouterSimpleCubit());
  getIt.registerSingleton(CounterCubit());
  getIt.registerSingleton(ThemeCubit());
  getIt.registerSingleton(InvitadosBloc());
  getIt.registerSingleton(PokemonBloc(fetchPokemon: PokemonInformation.getPokemonName));
    getIt.registerSingleton(HistoryLocationBlocBloc());
  getIt.registerSingleton(GeolocationCubit(
    onNewLocation: 
      getIt<HistoryLocationBlocBloc>().onNewUserLocation,
  )..watchPosition());



}
