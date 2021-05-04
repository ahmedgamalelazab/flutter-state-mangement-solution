import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:redux_project/buiseniss%20logic/cubit/counter_cubit.dart';
import 'package:redux_project/buiseniss%20logic/cubit/internet%20cubit/internetconnection_cubit.dart';
import 'package:redux_project/constant/enums/connectionType.dart';
import 'package:redux_project/presentation/Screens/SecondScreen.dart';

class FirstScreen extends StatelessWidget {
  static const String PageRoute = "/";
  const FirstScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child:
                  BlocBuilder<InternetconnectionCubit, InternetconnectionState>(
                builder: (context, state) {
                  if (state is InternetConnected &&
                      state.connectionType == ConnectionType.Wifi) {
                    return Text("Connected to Wifi");
                  } else if (state is InternetConnected &&
                      state.connectionType == ConnectionType.Mobile) {
                    return Text("Connected to mobile Celler");
                  } else if (state is InternetDisConnected) {
                    return Text("not Connected");
                  }
                  return CircularProgressIndicator();
                },
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).increment();
                    },
                    child: Icon(Icons.add),
                  ),
                  BlocConsumer<CounterCubit, CounterState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      return Container(child: Text(state.counter.toString()));
                    },
                  ),
                  MaterialButton(
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).decrement();
                    },
                    child: Icon(Icons.remove),
                  ),
                ],
              ),
            ),
            Container(
              child: MaterialButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacementNamed(SecondScreen.PageRoute);
                },
                child: Text("SecondScreen"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
