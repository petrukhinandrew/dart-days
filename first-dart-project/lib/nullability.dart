import 'dart:math' show pi;
// можно сделать import 'dart:math';
// так мы вытаскиваем из модуля только pi

double deg2rad({int? deg}) {
  // double forcedDeg = deg!.toDouble(); // Kotlin !! аналог
  // если строка выше не сломалась, дальше dart будет знать, что deg != null

  double? mayBeDeg = deg?.toDouble(); // либо null, либо корректно скастуется

  double degOrZero = mayBeDeg ?? 0;
  // то же самое, что mayBeDeg == null ? 0 : mayBeDeg;

  // mayBeDeg ??= 0;
  // double t = mayBeDeg; // dart вывел, что
  // mayBeDeg уже не может быть null после ??= как с !

  return degOrZero / 180.0 * pi;
}

void main() => print(deg2rad(deg: 180));
// void main() => deg2rad(deg: null);
