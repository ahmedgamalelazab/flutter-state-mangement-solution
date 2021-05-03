import 'package:flutter/material.dart';
import 'state/inheritedWidgets.dart';

void main() {
  runApp(
    StateContainer(child: MyApplication()),
  );
}

class MyApplication extends StatelessWidget {
  const MyApplication({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
          ],
        ),
      ),
    );
  }
}
