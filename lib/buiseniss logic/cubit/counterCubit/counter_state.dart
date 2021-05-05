part of 'counter_cubit.dart';

class CounterState {
  int _counterNumber;
  int get counter => _counterNumber;

  CounterState({int counter}) {
    this._counterNumber = counter ?? 0;
  }

  Map<String, dynamic> toMap() {
    return {
      '_counterNumber': _counterNumber,
    };
  }

  factory CounterState.fromMap(Map<String, dynamic> map) {
    return CounterState(
      counter: map['_counterNumber'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CounterState.fromJson(String source) =>
      CounterState.fromMap(json.decode(source));
}
