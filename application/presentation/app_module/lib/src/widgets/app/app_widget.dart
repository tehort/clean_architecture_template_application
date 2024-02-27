import 'package:app_module/app_module.dart';
import 'package:authentication_module/authentication_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_module/home_module.dart';
import 'package:service_locator/service_locator.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: ServiceLocator.get<AuthenticationBloc>()),
        BlocProvider.value(value: ServiceLocator.get<ThemeBloc>()),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'My App',
            debugShowCheckedModeBanner: false,
            theme: state.themeData,
            onGenerateRoute: OnGenerateRoute.route,
            initialRoute: '/',
            routes: {
              '/': (context) {
                return BlocBuilder<AuthenticationBloc, AuthenticationState>(
                  builder: (context, authState) {
                    switch (authState) {
                      case Unauthenticated():
                        return const SignInPage();
                      case Authenticated():
                        return const HomePage();
                      case Loading():
                        return const SplashPage();
                    }
                  },
                );
              },
            },
          );
        },
      ),
    );
  }
}
