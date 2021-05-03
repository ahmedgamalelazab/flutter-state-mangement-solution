abstract class Action {} //it just an action

class Increment extends Action {
  int _payload;
  int get payload => _payload;
  Increment({int payload}) {
    this._payload = payload;
  }
}

class Decrement extends Action {
  int _payload;
  int get payload => _payload;
  Decrement({int payload}) {
    this._payload = payload;
  }
}
