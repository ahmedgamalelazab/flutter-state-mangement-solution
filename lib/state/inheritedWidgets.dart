import 'package:flutter/material.dart';

class StateContainer extends StatefulWidget {
  StateContainer({Key key, this.child}) : super(key: key);

  final Widget child;

  @override
  _StateContainerState createState() => _StateContainerState();
}

//this is my data storage
class _StateContainerState extends State<StateContainer> {
  //used this only as data container
  int intialCounterValue = 0;

  void increment() {
    setState(() {
      intialCounterValue++;
    });
  }

  void decrement() {
    setState(() {
      intialCounterValue--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return StateInheritedWidget(child: widget.child, data: this);
  }
}

//this is the context storage
class StateInheritedWidget extends InheritedWidget {
  StateInheritedWidget({Key key, this.child, this.data})
      : super(key: key, child: child);

  final _StateContainerState data;
  final Widget child;

  static StateInheritedWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<StateInheritedWidget>();
  }

  @override
  bool updateShouldNotify(StateInheritedWidget oldWidget) {
    return true;
  }
}
