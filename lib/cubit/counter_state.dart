part of 'counter_cubit.dart';

class CounterState {
  int _counterValue = 0;
  bool _gotIncrement = false;
  bool get gotIncrement => _gotIncrement;
  int get countetValue => _counterValue;
  CounterState({@required int counterVal, @required bool gotIncrement}) {
    this._counterValue = counterVal;
    this._gotIncrement = gotIncrement;
  }
}
