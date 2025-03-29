
import 'package:blocs_app/presentation/blocs/04-bloc/invitados_bloc.dart';
import 'package:blocs_app/presentation/blocs/05-pokemon-bloc/pokemon_bloc.dart';
import 'package:blocs_app/presentation/blocs/07-historylocation-bloc.dart/history_location_bloc_bloc.dart';
import 'package:flutter/material.dart';
import 'package:blocs_app/config/config.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:blocs_app/presentation/blocs/blocs.dart';

void main() {
  serviceLocator();
  runApp(const BlocProviders());
}



class  BlocProviders extends StatelessWidget {
  const BlocProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        //creamo las instacia de los cubits
        BlocProvider(create: (context)=>getIt<UsernameCubit>() ),
        BlocProvider(create: (context)=>getIt<RouterSimpleCubit>()),
        BlocProvider(create: (context)=>getIt<CounterCubit>()),
        BlocProvider(create: (context)=>getIt<ThemeCubit>()),
        BlocProvider(create: (context)=>getIt<InvitadosBloc>()),
        BlocProvider(create: (context)=>getIt<PokemonBloc>()),
        BlocProvider(create: (context)=>getIt<GeolocationCubit>()),
        BlocProvider(create: (context)=>getIt<HistoryLocationBlocBloc>()),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeCubit=context.watch<ThemeCubit>().state;

    final apppRouter=context.read<RouterSimpleCubit>().state;

    return MaterialApp.router(
      title: 'Flutter BLoC',
      debugShowCheckedModeBanner: false,
      routerConfig: apppRouter,
      theme: AppTheme( isDarkmode: themeCubit.isDark ).getTheme(),
    );
  }
}
