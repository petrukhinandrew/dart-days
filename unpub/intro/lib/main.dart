import 'dart:io';

void helloWorld() {
  // dynamic kek = 5;
  // kek = "hello";
  // print(kek);
  String greeting = "Hello"; // same as var str = "Hello"; - both mutable
  // does not work as var String str = ... ;
  greeting = "Hello, world";
  greeting += "!";
  print(greeting); // puts \n by default
  print('My number is: ${11 + 20}'); // kotlin-like string template
}

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

const int exampleIntConst = 5; // same as `const exampleIntConst = 5;`
// compile-time const, immutable
final int exampleIntFinal = 5;
// non-compile-time, immutable

int getValue() {
  return 10;
}

// const assignmentExample = get_value(); - error
final assignmentExample = getValue(); // ok
// type inference works well, btw

// funciton calls does not work somwhere out of functions, C/C++ like
// print(assignmentExample); fails

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

void main() {
  print("Entry point, just like C++");
  stdout.write("String with no \\n in the end");
  stdout.write("\nthis one contains \\n in the beginning and in the end\n");

  helloWorld();
}

(String, int) recordRetType() => ("kek", 67);
void tmp_main() {
  String s = "";
  int i = 0;
  s = "123";
  (s, i) = ("lol", 45);
  print("$s $i");
  (s, i) = recordRetType();
  print("$s $i");
}

bool implicitArg([int? arg]) {
  print('arg is $arg');
  return arg != null;
}

// try runninng with no args given to implicitArg fun
void tmp_tmp_main(List<String> args) => print(implicitArg(2));
