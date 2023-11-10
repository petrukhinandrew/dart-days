import 'package:injectable/injectable.dart';

abstract class MotorcycleWheel {
  double get radius;
}

@Named("13")
@Injectable(as: MotorcycleWheel)
class MotorcycleWheel13Inch implements MotorcycleWheel {
  @override
  double get radius => 13.0;
}
