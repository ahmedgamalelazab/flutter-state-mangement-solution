import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:redux_project/buiseniss%20logic/cubit/counter_cubit.dart';
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
