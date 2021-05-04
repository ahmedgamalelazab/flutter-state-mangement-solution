import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:redux_project/buiseniss%20logic/cubit/internet%20cubit/internetconnection_cubit.dart';
import 'package:redux_project/constant/enums/connectionType.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  //the goal in this version is to connect two cubits together
  final InternetconnectionCubit internetCubit;
  StreamSubscription internetCubitStreamSubscription;

  CounterCubit({@required this.internetCubit})
      : super(CounterState(counter: 0)) {
    internetCubitStreamSubscription =
        internetCubit.stream.listen((internetState) {
      if (internetState is InternetConnected &&
          internetState.connectionType == ConnectionType.Wifi) {
        increment();
      } else if (internetState is InternetConnected &&
          internetState.connectionType == ConnectionType.Mobile) {
        increment();
      } else if (internetState is InternetDisConnected) {
        decrement();
      }
    });
  }

  //section of Logic
  void increment() => emit(CounterState(counter: state._counterNumber + 1));
  void decrement() => emit(CounterState(counter: state._counterNumber - 1));

  @override
  Future<void> close() {
    internetCubitStreamSubscription.cancel();
    return super.close();
  }
}
