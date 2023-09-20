import 'package:get_it/get_it.dart';

class ServiceLocator {
  static final _sl = GetIt.instance;

  static T get<T extends Object>({String? instanceName}) {
    return _sl<T>(instanceName: instanceName);
  }

  static void registerFactory<T extends Object>(
    FactoryFunc<T> factoryFunc, {
    String? instanceName,
  }) {
    _sl.registerFactory<T>(factoryFunc, instanceName: instanceName);
  }

  static void registerLazySingleton<T extends Object>(
    FactoryFunc<T> factoryFunc, {
    String? instanceName,
    DisposingFunc<T>? dispose,
  }) {
    _sl.registerLazySingleton<T>(factoryFunc, instanceName: instanceName, dispose: dispose);
  }
}
