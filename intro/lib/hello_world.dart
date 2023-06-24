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
