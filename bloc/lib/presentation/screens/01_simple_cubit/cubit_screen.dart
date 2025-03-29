import 'package:blocs_app/config/helpers/random_generator.dart';
import 'package:blocs_app/presentation/blocs/01simple_cubit/username_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';


class CubitScreen extends StatelessWidget {
  const CubitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //primera manera de trabajar con cubit
    // final userNameCubit = context.watch<UsernameCubit>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cubit'),
      ),
      body: Center(
        // child: Text(userNameCubit.state.toString()),
        child: BlocBuilder<UsernameCubit, String>(
          // buildWhen: (previous,current)=>previous != current,
          builder: (context, state) {
            return Text(state);
          },
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Aquí puedes definir la acción que deseas realizar al presionar el botón
    // userNameCubit.setUserName(RandomGenerator.getRandomName());
    context.read<UsernameCubit>().setUserName(
 RandomGenerator.getRandomName()
    );

        },
        child: const Icon(Icons.add),
      ),
    );
  }
}