import 'package:app/app.dart';
import 'package:app/src/presentation/routes/on_generate_route.dart';
import 'package:app/src/presentation/splash/widgets/splash_screen.dart';
import 'package:authentication/authentication.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home/home.dart';
import 'package:service_locator/service_locator.dart';

class App extends StatelessWidget {
  const App({super.key});

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
                        return const SplashScreen();
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
