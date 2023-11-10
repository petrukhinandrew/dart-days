// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:di_intro/motorcycle.dart' as _i7;
import 'package:di_intro/motorcycle_body.dart' as _i5;
import 'package:di_intro/motorcycle_manufacturer.dart' as _i4;
import 'package:di_intro/motorcycle_wheel.dart' as _i6;
import 'package:di_intro/stupid.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

const String _test = 'test';
const String _dev = 'dev';
const String _prod = 'prod';

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.Counter>(
      _i3.Counter(),
      registerFor: {_test},
    );
    gh.factory<_i3.CounterUser>(() => _i3.CounterUser.dev());
    gh.singleton<_i4.HondaManufacturer>(_i4.HondaManufacturer());
    gh.singleton<_i4.KawasakiManufacturer>(_i4.KawasakiManufacturer());
    gh.factory<_i5.MotorcycleBody>(
      () => _i5.MotorcycleRedBody(),
      registerFor: {_test},
    );
    gh.factory<_i5.MotorcycleBody>(
      () => _i5.MotorcycleBlueBody(),
      registerFor: {_dev},
    );
    gh.factory<_i5.MotorcycleBody>(
      () => _i5.MotorcycleGreenBody(),
      registerFor: {_prod},
    );
    gh.factory<_i6.MotorcycleWheel>(
      () => _i6.MotorcycleWheel13Inch(),
      instanceName: '13',
    );
    gh.factory<_i7.HondaMotorcycle>(() => _i7.HondaMotorcycle(
          gh<_i4.HondaManufacturer>(),
          gh<_i5.MotorcycleBody>(),
          gh<_i6.MotorcycleWheel>(instanceName: '13'),
        ));
    gh.factory<_i7.KawasakiMotorcycle>(() => _i7.KawasakiMotorcycle(
          gh<_i4.KawasakiManufacturer>(),
          gh<_i5.MotorcycleBody>(instanceName: 'red'),
          gh<_i6.MotorcycleWheel>(instanceName: '13'),
        ));
    return this;
  }
}
