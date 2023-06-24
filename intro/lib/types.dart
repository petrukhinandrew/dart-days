int globalInt = 5;
int _curFileGlobalInt = 4;

int someIntFunc() {
  int localInt = 1;
  return globalInt + localInt + _curFileGlobalInt;
}

void someBoolFunc() {
  bool t = true;
  print('t is $t');
  print('not t is ${!t}');
  print('not t or t is ${!t || t}'); // here
  print('not t and t is ${!t && t}'); // and here
  // depending on t value ide complains about unreacheable code
}

void someDoubleFunc() {
  double d1 = 0.5;
  var d2 = 0.5;
  assert(d1 + d2 == 1);
  assert(d1 + d2 != 5, "Assertion message is also possible");
  // even though double + double == double, theese assertions pass

  // no float available, only double
  // we can use Float or Int from c-interop, btw
}
