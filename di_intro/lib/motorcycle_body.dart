import 'package:injectable/injectable.dart';

enum MotorcycleColor { red, green, blue }

abstract class MotorcycleBody {
  MotorcycleColor get color;
}
// TODO: использовать environment.
// В нужный класс можно хардкодить цвет - это ок
// Соответствие такое:
// @test -> red
// @dev  -> blue
// @prod -> green

class MotorcycleRedBody implements MotorcycleBody {}

class MotorcycleGreenBody implements MotorcycleBody {}

class MotorcycleBlueBody implements MotorcycleBody {}
