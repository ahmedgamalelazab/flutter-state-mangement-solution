//preparing to a real simple project represented in patch 1.0.3
// the aim of this patch is use the bloc with perfect structure as could as possible
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:redux_project/buiseniss%20logic/cubit/CounterCubit/counter_cubit.dart';
import 'package:redux_project/presentation/Router/genratedRoutes.dart';
import 'buiseniss logic/cubit/internet cubit/internetconnection_cubit.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // this is a bride between flutter native code and flutter code
  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());
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
