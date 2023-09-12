import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/src/app/dependency_injection.dart';
import 'package:presentation/src/app/on_generate_route.dart';
import 'package:presentation/src/authentication/bloc/authentication_bloc.dart';
import 'package:presentation/src/sign_in/widgets/sign_in_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<AuthenticationBloc>()),
      ],
      child: MaterialApp(
        title: 'My App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue),
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
                    return const SignInPage();
                }
              },
            );
          },
        },
      ),
    );
  }
}
