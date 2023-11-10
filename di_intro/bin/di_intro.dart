import 'package:di_intro/configure_dependencies.dart';
import 'package:di_intro/instance_counter.dart';
import 'package:di_intro/motorcycle.dart';
import 'package:di_intro/motorcycle_body.dart';

bool envMatchesColor(String env, MotorcycleColor color) => switch (color) {
      MotorcycleColor.red => env == "test",
      MotorcycleColor.blue => env == "dev",
      MotorcycleColor.green => env == "prod",
    };

void main() async {
  const String env = "dev";
  configureDependencies(env);
  InstanceCounter.display();
  assert(InstanceCounter.countMotorcycles("Honda") == 0);
  assert(InstanceCounter.countManufacturers("Kawasaki") == 1);

  final oneHondaBike = getIt<HondaMotorcycle>();
  assert(InstanceCounter.countMotorcycles("Honda") == 1);
  assert(oneHondaBike.wheelRadius == 13.0);
  assert(envMatchesColor(env, oneHondaBike.bodyColor));
  assert(InstanceCounter.countManufacturers("Honda") == 1);

  final kawasakis = List.generate(10, (index) => getIt<KawasakiMotorcycle>());
  assert(InstanceCounter.countMotorcycles("Kawasaki") == 10);

  final kawasaki = kawasakis[0];
  assert(kawasaki.wheelRadius == 15.0);
  assert(envMatchesColor(env, kawasaki.bodyColor));
  assert(InstanceCounter.countManufacturers("Kawasaki") == 1);

  InstanceCounter.display();
}
