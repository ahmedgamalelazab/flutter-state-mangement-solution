import 'package:redux/redux.dart';

import '../actions.dart';
import '../store.dart';

//handle the increment action here

void incrementMiddleware(
    Store<Counter> store, dynamic action, NextDispatcher next) {
  if (action is Increment) {
    next(IncrementWithPaylao());
    return;
  }
  next(Decrement());
  return;
}
