import 'package:di_intro/instance_counter.dart';
import 'package:injectable/injectable.dart';

abstract interface class MotorcycleManufacturer {
  String get name;
}

// TODO: добавить нужные аннотации к классам, использовать автоименование
// В результате работы программы не должно быть двух HondaManufacturer
// или двух KawasakiManufacturer. Строго по 1.

class HondaManufacturer with InstanceCounter implements MotorcycleManufacturer {
  HondaManufacturer() {
    newManufacturer("Honda");
  }
  @override
  String get name => "Honda";
}

class KawasakiManufacturer
    with InstanceCounter
    implements MotorcycleManufacturer {
  KawasakiManufacturer() {
    newManufacturer("Kawasaki");
  }
  @override
  String get name => "Kawasaki";
}
