import 'package:freezed_annotation/freezed_annotation.dart';

part 'freezed_example.freezed.dart';
part 'freezed_example.g.dart';

@unfreezed
class User with _$User {
  factory User({required final String name, required int age}) = _User;
  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);

  User._();

  void becomeOlder() {
    age += 1;
    print("Im older now");
  }
}

void eqExample() {
  final bob = User(name: "Bob", age: 100);
  print(bob == User(name: "Bob", age: 100));
}

void strExample() {
  final bob = User(name: "Bob", age: 100);
  print(bob);
}

void jsonExample() {
  final bobJson = User(name: "Bob", age: 100).toJson();
  print("Json ['name'] is ${bobJson['name']}");
  final bobFromJson = User.fromJson(bobJson);
  print(bobFromJson);
}

void becomeOlderExample() {
  final bob = User(name: "Bob", age: 10);
  bob.becomeOlder();
  print("Bob is now ${bob.age}");
}

void copyWithExample() {
  final bob = User(name: "Bob", age: 10);
  print(bob); // User(name: Bob, age: 10)
  final notBob = bob.copyWith(age: 12);
  print(notBob); // User(name: Bob, age: 12)
  notBob.age += 2;
  print(bob); // User(name: Bob, age: 10)
  print(notBob); // User(name: Bob, age: 14)
  final alice = notBob.copyWith(name: "Alice");
  print(alice); // User(name: Alice, age: 14)
}
