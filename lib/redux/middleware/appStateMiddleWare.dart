import 'package:redux/redux.dart';

import '../actions.dart';
import '../store.dart';

//handle the increment action here

void incrementMiddleware(
    Store<Counter> store, dynamic action, NextDispatcher next) {
  int storeBuffer = store.state.number; //read the store
  if (action is Increment) {
    //... do some code
    storeBuffer++;
    print("store buffer is : $storeBuffer");
    next(Increment(payload: storeBuffer));
  } else {
    print(storeBuffer);
    storeBuffer--;
    print("store buffer is : $storeBuffer");
    next(Decrement(payload: storeBuffer));
  }
}
