import 'dart:collection';

List<int> generator = List.generate(5, (index) => index * index);
// в python мы бы написали [i * i for i in range(5)]

void main() {
  final updatedGenerator =
      generator.map((e) => e - 1).toList(); // без toList был бы Iterable

  List<int> updatedAndSorted = updatedGenerator
    ..sort(((a, b) => b - a)); // две точки!
  // это тоже фича! Можно было бы написать с одной точкой, но

  // updatedGenerator.sort(((a, b) => b - a)); - имеет тип void

  updatedAndSorted.forEach(print); // вместо print можно передать лямбду

  final HashMap<String, int> memo = HashMap(); // просто узнаем, что она есть
  memo['lol'] = 5;
  assert(memo['kek'] == null);
}

// если хотите попрактиковаться
// in: [1, 1, 2, 2, 3, 3] => out [1, 2, 3]
// in: ["A", "a", "B", "a"] => out ["A", "a", "B"]

List<T> filterUnique<T>(List<T> initialList) {
  // узнайте, что такое Map.entries
  for (int idx = 0; idx < initialList.length; ++idx) {
    // понятно, что тут удобнее итерировать по-другому
    // но теперь вы знаете, что так тоже можно
  }
  return List.empty();
}

extension Flatten<T> on List<List<T>> {
  // так тут пишут функции расширения
// в скопе можно написать функции,
// которые можно будет использовать на типе List<List<T>> в данном случае
  List<T> flatten() {
    // this в этом месте будет иметь тип List<List<T>>
    for (List<T> elem in this) {}

    return [];
  }
}
