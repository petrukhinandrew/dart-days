import 'package:injectable/injectable.dart';

enum MotorcycleColor { red, green, blue }

abstract class MotorcycleBody {
  MotorcycleColor get color;
}

@test
@Injectable(as: MotorcycleBody)
class MotorcycleRedBody implements MotorcycleBody {
  @override
  MotorcycleColor get color => MotorcycleColor.red;
}

@dev
@Injectable(as: MotorcycleBody)
class MotorcycleBlueBody implements MotorcycleBody {
  @override
  MotorcycleColor get color => MotorcycleColor.blue;
}

@prod
@Injectable(as: MotorcycleBody)
class MotorcycleGreenBody implements MotorcycleBody {
  @override
  MotorcycleColor get color => MotorcycleColor.green;
}
