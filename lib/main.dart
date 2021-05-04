//preparing to a real simple project represented in patch 1.0.3
// the aim of this patch is use the bloc with perfect structure as could as possible
import 'package:flutter/material.dart';
import 'package:redux_project/buiseniss%20logic/cubit/counter_cubit.dart';
import 'package:redux_project/presentation/Router/genratedRoutes.dart';

void main() {
  runApp(MyApplication());
}

// ignore: must_be_immutable
class MyApplication extends StatefulWidget {
  MyApplication({Key key}) : super(key: key);

  @override
  _MyApplicationState createState() => _MyApplicationState();
}

class _MyApplicationState extends State<MyApplication> {
  CounterCubit _counterCubit = CounterCubit();
  AppRouter appRouter;

  @override
  void initState() {
    appRouter = AppRouter(counterCubit: _counterCubit);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: appRouter.onGenerateRoutes,
    );
  }

  @override
  void dispose() {
    _counterCubit.close();
    super.dispose();
  }
}
