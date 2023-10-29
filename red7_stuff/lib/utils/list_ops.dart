extension Flat<T> on List<List<T>> {
  List<T> flatten() {
    final List<T> res = [];
    forEach((sub) {
      res.addAll(sub);
    });
    return res;
  }
}

extension Count<T> on List<T> {
  int countBy(bool Function(T) acc) {
    int res = 0;
    forEach((element) {
      if (acc(element)) res++;
    });
    return res;
  }
}

extension Max<T> on List<T> {
  T? maxByOrNull<R extends Comparable>(R Function(T) conv) =>
      isEmpty ? null : maxBy(conv);

  T maxBy<R extends Comparable>(R Function(T) conv) {
    final List<R> converted = map(conv).toList();
    int idx = 0;

    for (int i = 0; i < length; ++i) {
      if (converted[i].compareTo(converted[idx]) > 0) idx = i;
    }

    return this[idx];
  }
}

extension MaxInt on List<int> {
  int? maxIntOrNull() => isEmpty ? null : maxBy((v) => v);
}

extension Filter<T> on List<T> {
  List<T> filterBy(bool Function(T) pred) {
    final List<T> filtered = [];
    for (T e in this) {
      if (pred(e)) filtered.add(e);
    }
    return filtered;
  }
}

extension MapMap<K, V> on Map<K, V> {
  List<R> asList<R>(R Function(K, V) conv) {
    final List<R> retVal = [];
    forEach((key, value) {
      retVal.add(conv(key, value));
    });
    return retVal;
  }
}
