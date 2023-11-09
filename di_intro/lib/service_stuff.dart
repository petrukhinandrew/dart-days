import 'package:injectable/injectable.dart';

@singleton
class ApiProvider {
  void greet() {
    print("Hello from ApiProvider");
  }
}

@injectable
class ApiUser {
  final ApiProvider api;
  const ApiUser(this.api);
  void greet() {
    api.greet();
  }
}

@injectable
class ServiceA {
  void sayHi() {
    print("Hi!");
  }
}

@injectable
class ServiceB {
  final ServiceA serviceA;
  const ServiceB(this.serviceA);
  void sayHi() {
    serviceA.sayHi();
  }
}

@injectable
class BackendService {
  final String url;
  BackendService(@factoryParam this.url);
}
