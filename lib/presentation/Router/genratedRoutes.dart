import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:redux_project/presentation/Screens/SecondScreen.dart';
import 'package:redux_project/presentation/Screens/ThirdScreen.dart';
import 'package:redux_project/presentation/Screens/firstScreen.dart';

class AppRouter {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case FirstScreen.PageRoute:
        return MaterialPageRoute(
          builder: (_) => FirstScreen(),
        );
        break;
      case SecondScreen.PageRoute:
        return MaterialPageRoute(
          builder: (_) => SecondScreen(),
        );
        break;
      case ThirdScreen.PageRoute:
        return MaterialPageRoute(
          builder: (_) => ThirdScreen(),
        );
        break;
      default:
        MaterialPageRoute(
          builder: (_) => FirstScreen(),
        );
        break;
    }
  }
}
