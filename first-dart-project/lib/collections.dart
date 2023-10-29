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
