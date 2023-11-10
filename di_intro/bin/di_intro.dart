import 'package:di_intro/configure_dependencies.dart';
import 'package:di_intro/instance_counter.dart';
import 'package:di_intro/motorcycle.dart';
import 'package:di_intro/motorcycle_body.dart';

void main() async {
  configureDependencies("dev");
  // CounterUser t = getIt<CounterUser>();
  // t.doThing();
  // t.doThing();
  // t.doThing();
  // InstanceCounter.observeInstances();
  // final List<Motorcycle> hondas =
  //     List.generate(10, (idx) => getIt<HondaMotorcycle>());
  // InstanceCounter.observeInstances();
  final h = getIt<HondaMotorcycle>();
  assert(h.bodyColor == MotorcycleColor.blue);
}
