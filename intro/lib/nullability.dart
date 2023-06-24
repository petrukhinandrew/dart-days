void someNullableFunc() {
  var nonNullInt = 100500;
  // nonNullInt = null; - Error

  int? nullableInt = 5; // is this a mix of kotlin and C ?
  // var? varName = ... ; does not work, btw
  nullableInt = null;
  print('int? set to null: $nullableInt');

  int? nullIntIntro;
  print('default value for int? that is not defined: $nullIntIntro');
  // this won't be working with `int` as it must be assigned before
}
