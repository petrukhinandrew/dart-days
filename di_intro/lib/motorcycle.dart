import 'package:di_intro/instance_counter.dart';
import 'package:injectable/injectable.dart';
import 'package:di_intro/motorcycle_wheel.dart' show MotorcycleWheel;
import 'package:di_intro/motorcycle_body.dart'
    show MotorcycleColor, MotorcycleBody;
import 'package:di_intro/motorcycle_manufacturer.dart'
    show MotorcycleManufacturer;

abstract class Motorcycle {
  double get wheelRadius;
  MotorcycleColor get bodyColor;
  String get manufacturerName;
}

// TODO: собрать классы ниже, реализовать соответствующий интерфейс

@injectable
class HondaMotorcycle with InstanceCounter implements Motorcycle {
  final MotorcycleWheel wheel; // радиус 13.0
  final MotorcycleBody body;
  final MotorcycleManufacturer manufacturer; // Honda
  HondaMotorcycle() {
    newMotorcycle("Honda");
  }
}

@injectable
class KawasakiMotorcycle with InstanceCounter implements Motorcycle {
  final MotorcycleWheel wheel; // радиус 15.0
  final MotorcycleBody body;
  final MotorcycleManufacturer manufacturer; // Kawasaki
  KawasakiMotorcycle() {
    newMotorcycle("Kawasaki");
  }
}
