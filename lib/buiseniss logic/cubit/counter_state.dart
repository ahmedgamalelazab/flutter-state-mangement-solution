part of 'counter_cubit.dart';

class CounterState {
  int _counterNumber;
  int get counter => _counterNumber;

  CounterState({int counter}) {
    this._counterNumber = counter ?? 0;
  }
}
