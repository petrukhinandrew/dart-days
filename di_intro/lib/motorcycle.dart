import 'package:di_intro/instance_counter.dart';
import 'package:injectable/injectable.dart';
import 'package:di_intro/motorcycle_wheel.dart' show MotorcycleWheel;
import 'package:di_intro/motorcycle_body.dart'
    show MotorcycleColor, MotorcycleBody;
import 'package:di_intro/motorcycle_manufacturer.dart';

abstract class Motorcycle {
  double get wheelRadius;
  MotorcycleColor get bodyColor;
  String get manufacturerName;
}

@injectable
class HondaMotorcycle with InstanceCounter implements Motorcycle {
  final MotorcycleWheel wheel;
  final MotorcycleBody body;
  final HondaManufacturer manufacturer;
  HondaMotorcycle(this.manufacturer, this.body, @Named("13") this.wheel) {
    newMotorcycle("Honda");
  }

  @override
  double get wheelRadius => wheel.radius;

  @override
  MotorcycleColor get bodyColor => body.color;

  @override
  String get manufacturerName => manufacturer.name;
}

@injectable
class KawasakiMotorcycle with InstanceCounter implements Motorcycle {
  final MotorcycleWheel wheel;
  final MotorcycleBody body;
  final KawasakiManufacturer manufacturer;
  KawasakiMotorcycle(
      this.manufacturer, @Named("red") this.body, @Named("13") this.wheel) {
    newMotorcycle("Kawasaki");
  }

  @override
  double get wheelRadius => wheel.radius;

  @override
  MotorcycleColor get bodyColor => body.color;

  @override
  String get manufacturerName => manufacturer.name;
}
