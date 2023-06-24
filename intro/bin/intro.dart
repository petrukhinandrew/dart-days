import 'package:intro/hello_world.dart' as hw;
import 'package:intro/types.dart' as types;
import 'package:intro/nullability.dart' as nullable;

// import 'package:intro/intro.dart'; <=> import 'package:intro/intro.dart' as intro;
// calculate() <=> intro.calculate();
void main(List<String> arguments) {
  hw.helloWorld();
  print(types.globalInt); // it is possible to get globals with imports
  // print(types._curFileGlobalInt); does not work
  // _varName makes it private in terms of file(probably, class also)
  print(types.someIntFunc());
  types.someDoubleFunc();
  nullable.someNullableFunc();
}
