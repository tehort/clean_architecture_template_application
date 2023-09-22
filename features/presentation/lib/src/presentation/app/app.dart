import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/src/presentation/app/dependency_injection.dart';
import 'package:presentation/src/presentation/app/on_generate_route.dart';
import 'package:presentation/src/presentation/app/theme/bloc/theme_bloc.dart';
import 'package:presentation/src/presentation/authentication/authentication/bloc/authentication_bloc.dart';
import 'package:presentation/src/presentation/authentication/sign_in/widgets/sign_in_page.dart';
import 'package:presentation/src/presentation/home/home/widgets/home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<AuthenticationBloc>()),
        BlocProvider(create: (context) => ThemeBloc()),
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
