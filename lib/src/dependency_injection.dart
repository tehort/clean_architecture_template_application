import 'package:app/app.dart';
import 'package:authentication/authentication.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:home/home.dart';
import 'package:rest_data_source_adapter/rest_adapter.dart';
import 'package:secure_local_storage_data_source_adapter/secure_local_storage_data_source_adapter.dart';
import 'package:secure_preferences_repository/secure_preferences_repository.dart';
import 'package:service_locator/service_locator.dart';
import 'package:usecases/usecases.dart';
import 'package:user_repository/user_repository.dart';

void configureDependencyInjection() {
  _setupOtherDependencies();
  _setupDataDependencies();
  _setupDomainDependencies();
  _setupDomainUsecasesDependencies();
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
  ServiceLocator.registerFactory<SecureLocalStorageDataSource>(
    () => SecureLocalStorageDataSourceImplementation(
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
  ServiceLocator.registerFactory<UserRepository>(
    () => UserRepositoryImplementation(
      userRemoteDataSource: ServiceLocator.get<UserRemoteDataSource>(),
    ),
  );
  ServiceLocator.registerFactory<SecurePreferencesRepository>(
    () => SecurePreferencesRepositoryImplementation(
      secureLocalStorageDataSource: ServiceLocator.get<SecureLocalStorageDataSource>(),
    ),
  );
  ServiceLocator.registerFactory<AuthenticationRepository>(
    () => AuthenticationRepositoryImplementation(
      authenticationRemoteDataSource: ServiceLocator.get<AuthenticationRemoteDataSource>(),
      securePreferencesRepository: ServiceLocator.get<SecurePreferencesRepository>(),
    ),
  );
}

void _setupDomainUsecasesDependencies() {
  ServiceLocator.registerFactory(
    () => SignInUseCase(
      authenticationRepository: ServiceLocator.get<AuthenticationRepository>(),
    ),
  );
  ServiceLocator.registerFactory(
    () => SignUpUseCase(
      authenticationRepository: ServiceLocator.get<AuthenticationRepository>(),
    ),
  );
  ServiceLocator.registerFactory(
    () => VerifyEmailUseCase(
      authenticationRepository: ServiceLocator.get<AuthenticationRepository>(),
    ),
  );
  ServiceLocator.registerFactory(
    () => SignInWithTokenUseCase(
      authenticationRepository: ServiceLocator.get<AuthenticationRepository>(),
    ),
  );
  ServiceLocator.registerFactory(
    () => SignOutUseCase(
      authenticationRepository: ServiceLocator.get<AuthenticationRepository>(),
    ),
  );
  ServiceLocator.registerFactory(
    () => GetLoggedUserUseCase(
      authenticationRepository: ServiceLocator.get<AuthenticationRepository>(),
      userRepository: ServiceLocator.get<UserRepository>(),
    ),
  );
}

void _setupPresentationDependencies() {
  ServiceLocator.registerLazySingleton(
    () => AuthenticationBloc(
      signInWithTokenUsecase: ServiceLocator.get<SignInWithTokenUseCase>(),
      signOutUsecase: ServiceLocator.get<SignOutUseCase>(),
    ),
  );
  ServiceLocator.registerFactory(
    () => SignInBloc(
      signInUsecase: ServiceLocator.get<SignInUseCase>(),
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
