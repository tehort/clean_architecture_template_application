import 'package:data/src/data_sources/local_data_sources/secure_local_storage_data_source.dart';
import 'package:data/src/data_sources/local_data_sources/secure_local_storage_data_source_implementation.dart';
import 'package:data/src/data_sources/remote_data_sources/authentication_remote_data_source.dart';
import 'package:data/src/data_sources/remote_data_sources/authentication_remote_data_source_implementation.dart';
import 'package:data/src/repositories/authentication_repository_implementation.dart';
import 'package:data/src/repositories/preferences_repository_implementation.dart';
import 'package:domain/src/repositories/authentication_repository.dart';
import 'package:domain/src/repositories/preferences_repository.dart';
import 'package:domain/src/usecases/authentication_sign_in_use_case.dart';
import 'package:domain/src/usecases/authentication_sign_up_use_case.dart';
import 'package:domain/src/usecases/authentication_verify_email_use_case.dart';
import 'package:presentation/src/presentation/app/theme/bloc/theme_bloc.dart';
import 'package:presentation/src/presentation/authentication/authentication/bloc/authentication_bloc.dart';
import 'package:presentation/src/presentation/authentication/sign_in/bloc/sign_in_bloc.dart';
import 'package:presentation/src/presentation/authentication/sign_up/bloc/sign_up_bloc.dart';
import 'package:presentation/src/presentation/authentication/verify_email/bloc/bloc/verify_email_bloc.dart';
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
  ServiceLocator.registerFactory<SecureLocalStorageDataSource>(
    () => SecureLocalStorageDataSourceImplementation(
      localStorageClient: ServiceLocator.get<SecureLocalStorageAdapter>(),
    ),
  );
}

void _setupDomainDependencies() {
  ServiceLocator.registerFactory<PreferencesRepository>(
    () => PreferencesRepositoryImplementation(
      secureLocalStorageDataSource: ServiceLocator.get<SecureLocalStorageDataSource>(),
    ),
  );
  ServiceLocator.registerFactory<AuthenticationRepository>(
    () => AuthenticationRepositoryImplementation(
      authenticationRemoteDataSource: ServiceLocator.get<AuthenticationRemoteDataSource>(),
      preferencesRepository: ServiceLocator.get<PreferencesRepository>(),
    ),
  );
  ServiceLocator.registerFactory(
    () => AuthenticationSignInUsecase(
      authenticationRepository: ServiceLocator.get<AuthenticationRepository>(),
      preferencesRepository: ServiceLocator.get<PreferencesRepository>(),
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
