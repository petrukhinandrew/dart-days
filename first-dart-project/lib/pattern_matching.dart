// так выглядит switch из Kotlin на максималках
void guessNumber(int x) {
  switch (x) {
    case < -100 || > 100:
      print('Совсем далеко');
    case < 0:
      print("Бери выше!");
    case 0:
      print("Не ноль");
    case (var a):
      print("Не $a");
  }
}

// то же самое, только больше походит на pattern-matching
void guessAgain(int x) {
  print(switch (x) {
    < -100 || > 100 => 'Совсем далеко',
    < 0 => "Бери выше!",
    0 => "Не ноль",
    _ => "Не угадал" // wildcard
  });
}

void anotherFeature() {
  // ну чем не Rust?
  var (a, [b, c]) = ('str', [1, 2]);
  print("a is $a, 'b': $b < 'c': $c");
}

void main() {
  anotherFeature();
  guessNumber(-100500);
  guessAgain(0);
}
