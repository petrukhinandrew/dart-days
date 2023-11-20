import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String name;
  const User({required this.name});

  @override
  List<Object> get props => [name];

  @override
  bool get stringify => true;
}

void eqExample() {
  final bob = User(name: "Bob");
  print(bob == User(name: "Bob"));
}

void strExample() {
  final bob = User(name: "Bob");
  print(bob);
}
