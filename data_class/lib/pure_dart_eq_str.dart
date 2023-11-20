class User {
  final String name;
  const User({required this.name});
}

void noEqualFail() {
  final bob = User(name: "Bob");
  print(bob == User(name: "Bob"));
}

void noToString() {
  final bob = User(name: "Bob");
  print(bob);
}
