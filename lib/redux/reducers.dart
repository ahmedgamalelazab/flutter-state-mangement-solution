import 'package:redux_project/redux/actions.dart';

import 'store.dart';

Counter reducers(Counter prevState, dynamic action) {
  print("-------------");
  print("In the reducer");

  if (action is Increment) {
    print(action.payload);
    return Counter.copyWith(prevState, action.payload);
  } else if (action is Decrement) {
    print(action.payload);
    return Counter.copyWith(prevState, action.payload);
  } else {
    return Counter(prevState.number);
  }
}
