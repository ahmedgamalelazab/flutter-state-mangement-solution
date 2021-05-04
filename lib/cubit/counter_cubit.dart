import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(counterVal: 0));

  //the functions here is a part of the CounterCubit not a part of the stream
  void increment() => emit(CounterState(counterVal: state._counterValue + 1));
  void decrement() => emit(CounterState(counterVal: state._counterValue - 1));
}
