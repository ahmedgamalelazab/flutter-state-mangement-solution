import 'package:redux/redux.dart';

import '../actions.dart';
import '../store.dart';

void decrementMiddleware(
    Store<Counter> store, dynamic action, NextDispatcher next) {
  int storeBuffer = store.state.number; //read the store
  if (action is Decrement) {
    storeBuffer--; //minus one of the value that stored in the storage
    next(DecrementPayLoad(payload: storeBuffer));
    return;
  }
  storeBuffer++;
  next(IncrementWithPaylao(payload: storeBuffer));
  return;
}
