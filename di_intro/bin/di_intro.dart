import 'package:di_intro/configure_dependencies.dart';
import 'package:di_intro/service_stuff.dart';

void main() async {
  configureDependencies();
  final t = getIt<ServiceB>();
  final x = getIt<ApiUser>();
  x.greet();
  getIt<ApiUser>().greet();
  t.sayHi();
  final par = getIt<BackendService>(param1: 5);
  print(par.url);
}
