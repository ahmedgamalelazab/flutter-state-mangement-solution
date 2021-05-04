//preparing to a real simple project represented in patch 1.0.3
// the aim of this patch is use the bloc with perfect structure as could as possible
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:redux_project/buiseniss%20logic/cubit/counter_cubit.dart';
import 'package:redux_project/presentation/Screens/SecondScreen.dart';
import 'package:redux_project/presentation/Screens/firstScreen.dart';

import 'presentation/Screens/ThirdScreen.dart';

void main() {
  runApp(MyApplication());
}

// ignore: must_be_immutable
class MyApplication extends StatelessWidget {
  CounterCubit _counterCubit = CounterCubit();
  MyApplication({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        FirstScreen.PageRoute: (context) => BlocProvider.value(
              value: _counterCubit,
              child: FirstScreen(),
            ),
        SecondScreen.PageRoute: (context) => BlocProvider.value(
              value: _counterCubit,
              child: SecondScreen(),
            ),
        ThirdScreen.PageRoute: (context) => BlocProvider.value(
              value: _counterCubit,
              child: ThirdScreen(),
            ),
      },
    );
  }
}
