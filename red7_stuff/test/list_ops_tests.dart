import 'package:red7_stuff/utils/list_ops.dart';
import 'package:test/test.dart';

class _TestComparableSample implements Comparable {
  final int _v;
  const _TestComparableSample(this._v);

  @override
  int compareTo(dynamic other) {
    if (other is! _TestComparableSample) return 0;
    return _v.compareTo(other._v);
  }

  @override
  String toString() => _v.toString();
}

void main() {
  group('maxBy', () {
    test('Int', () {
      const List<int> intList = [1, 2, 3, 4, 5];
      expect(5, intList.maxBy((v) => v));
      expect(4, intList.maxBy((v) => (v % 2 == 0) ? v / 2 : 0));
    });
    test('String', () {
      const List<String> strList = ["aa", "a", "f"];
      expect(strList.maxBy((v) => v), "f");
      expect(strList.maxBy((v) => v.length), "aa");
    });
    test('Test class', () {
      const List<_TestComparableSample> testList = [
        _TestComparableSample(2),
        _TestComparableSample(5),
        _TestComparableSample(4)
      ];
      expect(testList.maxBy((v) => v), const _TestComparableSample(5));
      expect(
          testList.maxBy((v) => v.toString()), const _TestComparableSample(5));
    });
  });
  group('countBy', () {
    test('IntEq', () {
      const List<int> intList = [1, 2, 1, 3, 3, 5, 5];
      expect(1, intList.countBy((p0) => p0 == 2));
      expect(2, intList.countBy((p0) => p0 == 5));
      expect(2, intList.countBy((p0) => p0 == 3));
    });
    test('IntEven', () {
      const List<int> intList = [1, 2, -2, 3, 4, 5, 8];
      expect(4, intList.countBy((p0) => p0 % 2 == 0));
      expect(4, intList.countBy((p0) => p0.isEven));
    });
    test('StrLenght', () {
      const List<String> strList = ["aa", "bb", "lolkek", "x"];
      expect(2, strList.countBy((s) => s.length == 2));
      expect(3, strList.countBy((s) => s.length >= 2));
      expect(1, strList.countBy((s) => s.length < 2));
    });
  });
  group('flatten', () {
    test('works', () {
      const List<List<int>> intLL = [
        [1],
        [2, 3],
        [4, 5],
        [6, 7, 8],
        [9, 10, 11],
      ];
      expect(intLL.flatten(), [for (int i = 1; i < 12; ++i) i]);
    });
    test('copies', () {
      List<List<int>> intLL = [
        [1],
        [2, 3],
        [4, 5],
        [6, 7, 8],
        [9, 10, 11],
      ];
      List<int> intL = intLL.flatten();
      intLL[0].add(100500);
      expect(intL, [for (int i = 1; i < 12; ++i) i]);
    });
  });
}
