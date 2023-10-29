// C++ - это, конечно, здорово, но у вас там есть Tuple? А вот в python...

(String, int) getData() => ("Hello", 100500);

(int, int) recordAsReturnValue() {
  var (word, number) = getData(); // распаковали tuple
  final wordLength = word.length;
  int sumOfDigits = 0;
  while (number > 0) {
    sumOfDigits += number % 10;
    number ~/= 10;
  }

  return (wordLength, sumOfDigits);
}

void main() {
  final (l, s) = recordAsReturnValue();
  print("$l $s"); // снова kotlin-like
}
