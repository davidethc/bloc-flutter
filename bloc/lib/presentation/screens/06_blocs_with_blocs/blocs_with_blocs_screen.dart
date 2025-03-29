  import 'package:blocs_app/presentation/blocs/06-geolocation/geolocation_cubit.dart';
import 'package:blocs_app/presentation/blocs/07-historylocation-bloc.dart/history_location_bloc_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class BlocsWithBlocsScreen extends StatelessWidget {
  const BlocsWithBlocsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 
    
    final historyLocationBloc = context.watch<HistoryLocationBlocBloc>();
    final locationState =historyLocationBloc.state;

    return Scaffold(
      appBar: AppBar(
        title:Text('ubicaciones: ${locationState.howManyPositions}'),
      ),
      body:  Center(
        child: ListView.builder(
          itemCount: locationState.howManyPositions,
          itemBuilder: (context, int index) {
            final position = locationState.positions[index];
            final(latitude, longitude) = position;
            return Text('${latitude} ${longitude}');
          },
        ),
      ),
      
    );

  }
}