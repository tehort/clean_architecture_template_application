import 'package:app/app.dart';
import 'package:authentication/authentication.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:rest_data_source_adapter/rest_adapter.dart';
import 'package:secure_local_storage_data_source_adapter/secure_local_storage_data_source_adapter.dart';
import 'package:service_locator/service_locator.dart';

void configureDependencyInjection() {
  _setupOtherDependencies();
  _setupDataDependencies();
  _setupDomainDependencies();
  _setupPresentationDependencies();
}

Future<void> _setupOtherDependencies() async {
  ServiceLocator.registerLazySingleton<RestAdapter>(
    RestAdapterImplementation.new,
  );
  ServiceLocator.registerFactory<SecureLocalStorageAdapter>(
    SecureLocalStorageAdapterImplementation.new,
  );
}

void _setupDataDependencies() {
  ServiceLocator.registerFactory<AuthenticationRemoteDataSource>(
    () => AuthenticationRemoteDataSourceImplementation(
      apiClient: ServiceLocator.get<RestAdapter>(),
    ),
  );
  ServiceLocator.registerFactory<AuthenticationSecureLocalStorageDataSource>(
    () => AuthenticationSecureLocalStorageDataSourceImplementation(
      localStorageClient: ServiceLocator.get<SecureLocalStorageAdapter>(),
    ),
  );
}

void _setupDomainDependencies() {
  ServiceLocator.registerFactory<AuthenticationRepository>(
    () => AuthenticationRepositoryImplementation(
      authenticationRemoteDataSource: ServiceLocator.get<AuthenticationRemoteDataSource>(),
      authenticationSecureLocalStorageDataSource: ServiceLocator.get<AuthenticationSecureLocalStorageDataSource>(),
    ),
  );
  ServiceLocator.registerFactory(
    () => AuthenticationSignInUsecase(
      authenticationRepository: ServiceLocator.get<AuthenticationRepository>(),
    ),
  );
  ServiceLocator.registerFactory(
    () => AuthenticationSignUpUsecase(
      authenticationRepository: ServiceLocator.get<AuthenticationRepository>(),
    ),
  );
  ServiceLocator.registerFactory(
    () => AuthenticationVerifyEmailUsecase(
      authenticationRepository: ServiceLocator.get<AuthenticationRepository>(),
    ),
  );
}

void _setupPresentationDependencies() {
  ServiceLocator.registerLazySingleton(
    AuthenticationBloc.new,
  );
  ServiceLocator.registerFactory(
    () => SignInBloc(
      authenticationSignInUsecase: ServiceLocator.get<AuthenticationSignInUsecase>(),
      authenticationBloc: ServiceLocator.get<AuthenticationBloc>(),
    ),
  );
  ServiceLocator.registerFactory(
    () => SignUpBloc(
      authenticationSignUpUsecase: ServiceLocator.get<AuthenticationSignUpUsecase>(),
    ),
  );
  ServiceLocator.registerFactory(
    () => VerifyEmailBloc(
      authenticationVerifyEmailUsecase: ServiceLocator.get<AuthenticationVerifyEmailUsecase>(),
    ),
  );
  ServiceLocator.registerLazySingleton(
    ThemeBloc.new,
  );
}
