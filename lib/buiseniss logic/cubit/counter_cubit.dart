import 'package:bloc/bloc.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(counter: 0)); // initial State

  //section of Logic
  void increment() => emit(CounterState(counter: state._counterNumber + 1));
  void decrement() => emit(CounterState(counter: state._counterNumber - 1));
}
