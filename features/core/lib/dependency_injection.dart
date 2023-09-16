import 'package:core/data_source_clients/rest_client_implementation.dart';
import 'package:core/data_source_clients/secure_local_storage_client_implementation.dart';
import 'package:data/core/rest_client.dart';
import 'package:data/core/secure_local_storage_client.dart';
import 'package:data/data_sources/local_data_sources/secure_local_storage_data_source.dart';
import 'package:data/data_sources/local_data_sources/secure_local_storage_data_source_implementation.dart';
import 'package:data/data_sources/remote_data_sources/authentication_remote_data_source.dart';
import 'package:data/data_sources/remote_data_sources/authentication_remote_data_source_implementation.dart';
import 'package:data/repositories/authentication_repository_implementation.dart';
import 'package:data/repositories/preferences_repository_implementation.dart';
import 'package:dio/dio.dart';
import 'package:domain/repositories/authentication_repository.dart';
import 'package:domain/repositories/preferences_repository.dart';
import 'package:domain/usecases/authentication_sign_in_use_case.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:presentation/presentation.dart';

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
    ..registerFactory<RestClient>(
      () => RestClientImplementation(
        dio: sl<Dio>(),
      ),
    )
    ..registerFactory<SecureLocalStorageClient>(
      () => SecureLocalStorageClientImplementation(
        storage: const FlutterSecureStorage(),
      ),
    );
}

void _setupDataDependencies() {
  sl
    ..registerFactory<AuthenticationRemoteDataSource>(
      () => AuthenticationRemoteDataSourceImplementation(
        apiClient: sl<RestClient>(),
      ),
    )
    ..registerFactory<SecureLocalStorageDataSource>(
      () => SecureLocalStorageDataSourceImplementation(
        localStorageClient: sl<SecureLocalStorageClient>(),
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
    );
}

void _setupPresentationDependencies() {
  sl
    ..registerFactory(AuthenticationBloc.new)
    ..registerFactory(
      () => SignInBloc(
        authenticationSignInUsecase: sl<AuthenticationSignInUsecase>(),
        authenticationBloc: sl<AuthenticationBloc>(),
      ),
    );
}
