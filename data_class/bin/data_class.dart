import 'package:data_class/pure_dart_eq_str.dart' as pd;
import 'package:data_class/equatable_example.dart' as eq;
import 'package:data_class/freezed_example.dart' as frd;

void main(List<String> arguments) {
  print("Pure Dart: ");
  pd.noEqualFail();
  pd.noToString();

  print("\nEquatable: ");
  eq.eqExample();
  eq.strExample();
  print("\nFreezed: ");
  frd.eqExample();
  frd.strExample();
  frd.jsonExample();
  frd.becomeOlderExample();
  frd.copyWithExample();
}
