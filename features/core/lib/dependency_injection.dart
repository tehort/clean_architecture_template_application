import 'package:data/data_sources/core/rest_client.dart';
import 'package:data/data_sources/core/rest_client_implementation.dart';
import 'package:data/data_sources/remote_data_sources/authentication_remote_data_source.dart';
import 'package:data/repositories/authentication_repository_implementation.dart';
import 'package:domain/repositories/authentication_repository.dart';
import 'package:domain/usecases/authentication_sign_in_use_case.dart';
import 'package:get_it/get_it.dart';
import 'package:presentation/presentation.dart';
import 'package:data/data_sources/remote_data_sources/authentication_remote_data_source_implementation.dart';

final sl = GetIt.instance;

void configureDependencyInjection() {
  _setupOtherDependencies();
  _setupDataDependencies();
  _setupDomainDependencies();
  _setupPresentationDependencies();
}

void _setupOtherDependencies() {
  sl.registerFactory<RestClient>(() => RestClientImplementation());
}

void _setupDataDependencies() {
  sl.registerFactory<AuthenticationRemoteDataSource>(
    () => AuthenticationRemoteDataSourceImplementation(apiClient: sl<RestClient>()),
  );
}

void _setupDomainDependencies() {
  sl.registerFactory<AuthenticationRepository>(
    () => AuthenticationRepositoryImplementation(authenticationRemoteDataSource: sl<AuthenticationRemoteDataSource>()),
  );
  sl.registerFactory(() => AuthenticationSignInUsecase(authenticationRepository: sl<AuthenticationRepository>()));
}

void _setupPresentationDependencies() {
  sl.registerFactory(() => AuthenticationBloc());
  sl.registerFactory(() => SignInBloc(authenticationSignInUsecase: sl<AuthenticationSignInUsecase>()));
}
