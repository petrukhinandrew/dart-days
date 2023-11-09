// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:di_intro/service_stuff.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt lolkek({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.ApiProvider>(_i3.ApiProvider());
    gh.factory<_i3.ApiUser>(() => _i3.ApiUser(gh<_i3.ApiProvider>()));
    gh.factoryParam<_i3.BackendService, String, dynamic>((
      url,
      _,
    ) =>
        _i3.BackendService(url));
    gh.factory<_i3.ServiceA>(() => _i3.ServiceA());
    gh.factory<_i3.ServiceB>(() => _i3.ServiceB(gh<_i3.ServiceA>()));
    return this;
  }
}