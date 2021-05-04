//preparing to a real simple project represented in patch 1.0.3
// the aim of this patch is use the bloc with perfect structure as could as possible
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:redux_project/buiseniss%20logic/cubit/counter_cubit.dart';
import 'package:redux_project/presentation/Router/genratedRoutes.dart';

import 'buiseniss logic/cubit/internet cubit/internetconnection_cubit.dart';

void main() {
  runApp(MyApplication(
    connectivity: Connectivity(),
  ));
}

// ignore: must_be_immutable
class MyApplication extends StatelessWidget {
  final Connectivity connectivity;
  const MyApplication({Key key, this.connectivity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                InternetconnectionCubit(connectivity: connectivity)),
        BlocProvider(
          create: (context) => CounterCubit(
            internetCubit: BlocProvider.of<InternetconnectionCubit>(context),
          ),
        ),
      ],
      child: MaterialApp(
        onGenerateRoute: AppRouter.onGenerateRoutes,
      ),
    );
  }
}
