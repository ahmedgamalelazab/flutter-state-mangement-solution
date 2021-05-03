//TODO create data storage for the whole process

class Counter {
  int _number;
  int get number => _number;

  Counter(this._number);

  Counter.initState() {
    this._number = 0;
  }

  Counter.copyWith(Counter prev, int number) {
    this._number = number ?? prev._number;
  }
}
