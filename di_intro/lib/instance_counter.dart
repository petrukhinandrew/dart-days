mixin class InstanceCounter {
  static final Map<String, int> _manufacturers = {};
  static final Map<String, int> _motorcycles = {};

  void newManufacturer(String name) {
    _manufacturers.update(
      name,
      (value) => ++value,
      ifAbsent: () => 1,
    );
  }

  void newMotorcycle(String name) {
    _motorcycles.update(name, (value) => ++value, ifAbsent: () => 1);
  }

  static void display() {
    print("==================");
    print("Manufacturers:");
    for (var m in _manufacturers.entries) {
      print("  ${m.key}: ${m.value}");
    }
    print("Motorcycles:");
    for (var m in _motorcycles.entries) {
      print("  ${m.key}: ${m.value}");
    }
    print("==================");
  }

  static int countMotorcycles(String name) => _motorcycles[name] ?? 0;
  static int countManufacturers(String name) => _manufacturers[name] ?? 0;
}
