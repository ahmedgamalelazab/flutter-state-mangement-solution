import 'package:redux/redux.dart';

import '../actions.dart';
import '../store.dart';

//handle the increment action here

void incrementMiddleware(
    Store<Counter> store, dynamic action, NextDispatcher next) {
  int storeBuffer = store.state.number; //read the store
  if (action is Increment) {
    storeBuffer++; //added one to the value that stored in the storage
    next(IncrementWithPaylao(payload: storeBuffer));
    return;
  }

  next(Decrement());
  return;
}
