import 'package:get_it/get_it.dart';

class AppModel {
  void update() {}
}

class FactoryTemplate {}

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<AppModel>(AppModel());
  getIt.registerFactory<FactoryTemplate>(() => FactoryTemplate());
// Alternatively you could write it if you don't like global variables
  GetIt.I.registerSingleton<AppModel>(AppModel());
  f(GetIt.I<AppModel>().update);
}

void f(void Function() kek) {
  kek();
}

class App {
  final model = GetIt.I<AppModel>();
}
