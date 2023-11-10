import 'package:di_intro/configure_dependencies.dart';
import 'package:di_intro/instance_counter.dart';

void main() async {
  configureDependencies("dev");
  InstanceCounter.display();
  assert(InstanceCounter.countMotorcycles("Honda") == 0);
}
