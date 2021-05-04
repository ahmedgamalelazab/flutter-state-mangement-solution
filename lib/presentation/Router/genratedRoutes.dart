import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:redux_project/buiseniss%20logic/cubit/counter_cubit.dart';
import 'package:redux_project/presentation/Screens/SecondScreen.dart';
import 'package:redux_project/presentation/Screens/ThirdScreen.dart';
import 'package:redux_project/presentation/Screens/firstScreen.dart';

class AppRouter {
  //fake instance dependency
  final CounterCubit counterCubit;

  AppRouter({@required this.counterCubit});

  Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case FirstScreen.PageRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: counterCubit,
            child: FirstScreen(),
          ),
        );
        break;
      case SecondScreen.PageRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: counterCubit,
            child: SecondScreen(),
          ),
        );
        break;
      case ThirdScreen.PageRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: counterCubit,
            child: ThirdScreen(),
          ),
        );
        break;
      default:
        MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: counterCubit,
            child: FirstScreen(),
          ),
        );
        break;
    }
  }
}
