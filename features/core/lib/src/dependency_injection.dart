import 'package:core/src/data_source_adapters/rest_adapter_implementation.dart';
import 'package:core/src/data_source_adapters/secure_local_storage_adapter_implementation.dart';
import 'package:data/src/core/rest_adapter.dart';
import 'package:data/src/core/secure_local_storage_adapter.dart';
import 'package:data/src/data_sources/local_data_sources/secure_local_storage_data_source.dart';
import 'package:data/src/data_sources/local_data_sources/secure_local_storage_data_source_implementation.dart';
import 'package:data/src/data_sources/remote_data_sources/authentication_remote_data_source.dart';
import 'package:data/src/data_sources/remote_data_sources/authentication_remote_data_source_implementation.dart';
import 'package:data/src/repositories/authentication_repository_implementation.dart';
import 'package:data/src/repositories/preferences_repository_implementation.dart';
import 'package:dio/dio.dart';
import 'package:domain/src/repositories/authentication_repository.dart';
import 'package:domain/src/repositories/preferences_repository.dart';
import 'package:domain/src/usecases/authentication_sign_in_use_case.dart';
import 'package:domain/src/usecases/authentication_sign_up_use_case.dart';
import 'package:domain/src/usecases/authentication_verify_email_use_case.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:presentation/src/presentation/authentication/authentication/bloc/authentication_bloc.dart';
import 'package:presentation/src/presentation/authentication/sign_in/bloc/sign_in_bloc.dart';
import 'package:presentation/src/presentation/authentication/sign_up/bloc/sign_up_bloc.dart';
import 'package:presentation/src/presentation/authentication/verify_email/bloc/bloc/verify_email_bloc.dart';

final sl = GetIt.instance;

void configureDependencyInjection() {
  _setupOtherDependencies();
  _setupDataDependencies();
  _setupDomainDependencies();
  _setupPresentationDependencies();
}

Future<void> _setupOtherDependencies() async {
  sl
    ..registerFactory<Dio>(Dio.new)
    ..registerFactory<RestAdapter>(
      () => RestAdapterImplementation(
        dio: sl<Dio>(),
      ),
    )
    ..registerFactory<SecureLocalStorageAdapter>(
      () => SecureLocalStorageAdapterImplementation(
        storage: const FlutterSecureStorage(),
      ),
    );
}

void _setupDataDependencies() {
  sl
    ..registerFactory<AuthenticationRemoteDataSource>(
      () => AuthenticationRemoteDataSourceImplementation(
        apiClient: sl<RestAdapter>(),
      ),
    )
    ..registerFactory<SecureLocalStorageDataSource>(
      () => SecureLocalStorageDataSourceImplementation(
        localStorageClient: sl<SecureLocalStorageAdapter>(),
      ),
    );
}

void _setupDomainDependencies() {
  sl
    ..registerFactory<PreferencesRepository>(
      () => PreferencesRepositoryImplementation(
        secureLocalStorageDataSource: sl<SecureLocalStorageDataSource>(),
      ),
    )
    ..registerFactory<AuthenticationRepository>(
      () => AuthenticationRepositoryImplementation(
        authenticationRemoteDataSource: sl<AuthenticationRemoteDataSource>(),
        preferencesRepository: sl<PreferencesRepository>(),
      ),
    )
    ..registerFactory(
      () => AuthenticationSignInUsecase(
        authenticationRepository: sl<AuthenticationRepository>(),
        preferencesRepository: sl<PreferencesRepository>(),
      ),
    )
    ..registerFactory(
      () => AuthenticationSignUpUsecase(
        authenticationRepository: sl<AuthenticationRepository>(),
      ),
    )
    ..registerFactory(
      () => AuthenticationVerifyEmailUsecase(
        authenticationRepository: sl<AuthenticationRepository>(),
      ),
    );
}

void _setupPresentationDependencies() {
  sl
    ..registerLazySingleton(AuthenticationBloc.new)
    ..registerFactory(
      () => SignInBloc(
        authenticationSignInUsecase: sl<AuthenticationSignInUsecase>(),
        authenticationBloc: sl<AuthenticationBloc>(),
      ),
    )
    ..registerFactory(
      () => SignUpBloc(
        authenticationSignUpUsecase: sl<AuthenticationSignUpUsecase>(),
      ),
    )
    ..registerFactory(
      () => VerifyEmailBloc(
        authenticationVerifyEmailUsecase: sl<AuthenticationVerifyEmailUsecase>(),
      ),
    );
}
