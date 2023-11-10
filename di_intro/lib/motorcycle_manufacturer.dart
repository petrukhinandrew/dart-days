import 'package:di_intro/instance_counter.dart';
import 'package:injectable/injectable.dart';

abstract interface class MotorcycleManufacturer {
  String get name;
  double get capitalization;
}

@singleton
class HondaManufacturer with InstanceCounter implements MotorcycleManufacturer {
  HondaManufacturer() {
    newManufacturer("Honda");
  }
  @override
  String get name => "Honda";
  @override
  double get capitalization => 100;
}

@singleton
class KawasakiManufacturer
    with InstanceCounter
    implements MotorcycleManufacturer {
  KawasakiManufacturer() {
    newManufacturer("Kawasaki");
  }
  @override
  String get name => "Kawasaki";
  @override
  double get capitalization => 200;
}
