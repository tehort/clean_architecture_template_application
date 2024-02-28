import 'package:app_module/app_module.dart';
import 'package:authentication_domain/authentication_domain.dart';
import 'package:authentication_module/authentication_module.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:home_module/home_module.dart';
import 'package:rest_data_source_adapter/rest_adapter.dart';
import 'package:secure_local_storage_data_source_adapter/secure_local_storage_data_source_adapter.dart';
import 'package:service_locator/service_locator.dart';
import 'package:user_domain/user_domain.dart';
import 'package:user_repository/user_repository.dart';

void configureDependencyInjection() {
  _setupDataDependencies();
  _setupDomainDependencies();
  _setupDomainUsecasesDependencies();
  _setupPresentationDependencies();
}

void _setupDataDependencies() {
  ServiceLocator.registerFactory<SecureLocalStorageAdapter>(
    SecureLocalStorageAdapterImplementation.new,
  );

  ServiceLocator.registerLazySingleton<RestAdapter>(
    RestAdapterImplementation.new,
  );

  ServiceLocator.registerFactory<AuthenticationRemoteDataSourceContract>(
    () => RemoteAuthenticationDataSourceImplementation(
      apiClient: ServiceLocator.get<RestAdapter>(),
    ),
  );
  ServiceLocator.registerFactory<AuthenticationLocalDataSourceContract>(
    () => AuthenticationLocalDataSourceImplementation(
      secureLocalStorageAdapter: ServiceLocator.get<SecureLocalStorageAdapter>(),
    ),
  );
  ServiceLocator.registerFactory<UserRemoteDataSource>(
    () => UserRemoteDataSourceImplementation(
      apiClient: ServiceLocator.get<RestAdapter>(),
    ),
  );
}

void _setupDomainDependencies() {
  ServiceLocator.registerFactory<UserRepositoryContract>(
    () => UserRepositoryImplementation(
      userRemoteDataSource: ServiceLocator.get<UserRemoteDataSource>(),
    ),
  );
  ServiceLocator.registerFactory<AuthenticationRepositoryContract>(
    () => AuthenticationRepositoryImplementation(
      authenticationRemoteDataSource: ServiceLocator.get<AuthenticationRemoteDataSourceContract>(),
      authenticationLocalDataSource: ServiceLocator.get<AuthenticationLocalDataSourceContract>(),
    ),
  );
}

void _setupDomainUsecasesDependencies() {
  ServiceLocator.registerFactory(
    () => SignInWithCredentialsUseCase(
      authenticationRepository: ServiceLocator.get<AuthenticationRepositoryContract>(),
    ),
  );
  ServiceLocator.registerFactory(
    () => SignUpUseCase(
      authenticationRepository: ServiceLocator.get<AuthenticationRepositoryContract>(),
    ),
  );
  ServiceLocator.registerFactory(
    () => VerifyEmailUseCase(
      authenticationRepository: ServiceLocator.get<AuthenticationRepositoryContract>(),
    ),
  );
  ServiceLocator.registerFactory(
    () => SignInFromStorageUseCase(
      authenticationRepository: ServiceLocator.get<AuthenticationRepositoryContract>(),
    ),
  );
  ServiceLocator.registerFactory(
    () => SignOutUseCase(
      authenticationRepository: ServiceLocator.get<AuthenticationRepositoryContract>(),
    ),
  );
  ServiceLocator.registerFactory(
    () => RefreshTokenUseCase(
      authenticationRepository: ServiceLocator.get<AuthenticationRepositoryContract>(),
    ),
  );
  ServiceLocator.registerFactory(
    () => GetLoggedUserUseCase(
      authenticationRepository: ServiceLocator.get<AuthenticationRepositoryContract>(),
      userRepository: ServiceLocator.get<UserRepositoryContract>(),
    ),
  );
}

void _setupPresentationDependencies() {
  ServiceLocator.registerLazySingleton(
    () => AuthenticationBloc(
      signInFromStorageUsecase: ServiceLocator.get<SignInFromStorageUseCase>(),
      signOutUsecase: ServiceLocator.get<SignOutUseCase>(),
    ),
  );
  ServiceLocator.registerFactory(
    () => SignInBloc(
      signInWithCredentialsUsecase: ServiceLocator.get<SignInWithCredentialsUseCase>(),
      authenticationBloc: ServiceLocator.get<AuthenticationBloc>(),
    ),
  );
  ServiceLocator.registerFactory(
    () => SignUpBloc(
      signUpUsecase: ServiceLocator.get<SignUpUseCase>(),
    ),
  );
  ServiceLocator.registerFactory(
    () => VerifyEmailBloc(
      verifyEmailUsecase: ServiceLocator.get<VerifyEmailUseCase>(),
    ),
  );
  ServiceLocator.registerLazySingleton(
    ThemeBloc.new,
  );
  ServiceLocator.registerLazySingleton(
    HomeTabBloc.new,
  );
  ServiceLocator.registerLazySingleton(
    () => HomePageContentBloc(
      getLoggedUserUseCase: ServiceLocator.get<GetLoggedUserUseCase>(),
    ),
  );
}
