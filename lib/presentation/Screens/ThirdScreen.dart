import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../buiseniss%20logic/cubit/counter_cubit.dart';
import 'firstScreen.dart';

class ThirdScreen extends StatelessWidget {
  static const String PageRoute = "/ThirdScreen";
  const ThirdScreen({Key key}) : super(key: key);

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
                      .pushReplacementNamed(FirstScreen.PageRoute);
                },
                child: Text("FirstScreen"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
