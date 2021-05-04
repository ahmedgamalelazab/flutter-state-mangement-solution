part of 'counter_cubit.dart';

class CounterState {
  int _counterValue = 0;
  int get countetValue => _counterValue;
  CounterState({@required int counterVal}) {
    this._counterValue = counterVal;
  }
}
