// to restrict the types the E accepts , use extends 
// class Tuple<E extends num> , to restric E to only int and double
class Tuple<E> {
  final E? _a;
  final E? _b;
  final E? _c;

  const Tuple(this._a, this._b, this._c);

  Tuple.fromList(List<E> list)
      : _a = list.asMap().containsKey(0) ? list[0] : null,
        _b = list.asMap().containsKey(1) ? list[1] : null,
        _c = list.asMap().containsKey(2) ? list[2] : null;

  E? get first => _a;
  E? get second => _b;
  E? get third => _c;

  Tuple<num> operator +(Tuple<num> t) {
    if (this is Tuple<num>) {
      final thisasNum = this as Tuple<num>;
      return Tuple(
          thisasNum._a! + t._a!, thisasNum._b! + t._b!, thisasNum._c! + t._c!);
    }
    return const Tuple(0, 0, 0);
  }

  Tuple<num> operator -(Tuple<num> t) {
    if (this is Tuple<num>) {
      final thisasNum = this as Tuple<num>;
      return Tuple(
          thisasNum._a! - t._a!, thisasNum._b! - t._b!, thisasNum._c! - t._c!);
    }
    return const Tuple(0, 0, 0);
  }

  @override
  String toString() => 'Tuple(first: $first, second: $second, third: $third)';
}

void main() {
  Tuple tuple1 = const Tuple(1, 2, 3);
  Tuple tuple2 = const Tuple(1, 2, 3);
  Tuple tuple3 = Tuple(4, 3, 5);
  Tuple tuple4 = Tuple("this", "is", "string");

  print(tuple1.hashCode);
  print(tuple2.hashCode);

  print(tuple3);
  print(tuple4);
}
