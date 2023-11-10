abstract interface class MotorcycleWheel {
  double get radius;
}

// TODO: использовать @Named
// Классы реализуют интерфейс выше и возвращают 13.0 и 15.0 соответственно

class MotorcycleWheel13Inch implements MotorcycleWheel {}

class MotorcycleWheel15Inch implements MotorcycleWheel {}
