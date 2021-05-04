import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_project/cubit/counter_cubit.dart';
import 'package:redux_project/redux/actions.dart';
import 'redux/middleware/appStateMiddleWare.dart';
import 'redux/reducers.dart';
import 'redux/store.dart';
import 'state/inheritedWidgets.dart';

void main() {
  Store<Counter> _store = Store<Counter>(reducers,
      initialState: Counter.initState(), middleware: [appStateController]);
  runApp(
    StateContainer(
        child: MyApplication(
      store: _store,
    )),
  );
}

class MyApplication extends StatelessWidget {
  const MyApplication({Key key, this.store}) : super(key: key);
  final store;
  @override
  Widget build(BuildContext context) {
    return StoreProvider<Counter>(
        store: store,
        child: BlocProvider<CounterCubit>(
          create: (context) => CounterCubit(),
          child: MaterialApp(
            home: Scaffold(
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    // color: Colors.red,
                    // alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RaisedButton(
                            onPressed: () {
                              StateInheritedWidget.of(context).data.increment();
                            },
                            child: Text("increment")),
                        Container(
                            child: Text(StateInheritedWidget.of(context)
                                .data
                                .intialCounterValue
                                .toString())),
                        RaisedButton(
                            onPressed: () {
                              StateInheritedWidget.of(context).data.decrement();
                            },
                            child: Text("increment")),
                      ],
                    ),
                  ),
                  StoreConnector<Counter, Counter>(
                    converter: (store) => store.state,
                    builder: (context, state) => Container(
                      // color: Colors.red,
                      // alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          RaisedButton(
                              onPressed: () {
                                StoreProvider.of<Counter>(context)
                                    .dispatch(Increment());
                              },
                              child: Text("increment")),
                          Container(child: Text(state.number.toString())),
                          RaisedButton(
                              onPressed: () {
                                StoreProvider.of<Counter>(context)
                                    .dispatch(Decrement());
                              },
                              child: Text("decrement")),
                        ],
                      ),
                    ),
                  ),
                  BlocBuilder<CounterCubit, CounterState>(
                    builder: (context, state) {
                      return Container(
                        // color: Colors.red,
                        // alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RaisedButton(
                                onPressed: () {
                                  BlocProvider.of<CounterCubit>(context)
                                      .increment();
                                },
                                child: Text("increment")),
                            Container(
                                child: Text(state.countetValue.toString())),
                            RaisedButton(
                                onPressed: () {
                                  BlocProvider.of<CounterCubit>(context)
                                      .decrement();
                                },
                                child: Text("increment")),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
