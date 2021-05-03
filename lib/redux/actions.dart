abstract class Action {} //it just an action

class Increment extends Action {}

class IncrementWithPaylao extends Action {
  int _payload;
  int get payload => _payload;
  IncrementWithPaylao({int payload}) {
    this._payload = payload;
  }
}

class Decrement extends Action {}

class DecrementPayLoad extends Action {
  int _payload;
  int get payload => _payload;
  DecrementPayLoad({int payload}) {
    this._payload = payload;
  }
}
