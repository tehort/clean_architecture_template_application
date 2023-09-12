import 'package:flutter/material.dart';
import 'package:presentation/src/sign_in/widgets/sign_in_page.dart';
import 'package:presentation/src/utils/pages_names_constants.dart';

class OnGenerateRoute {
  static Route<dynamic>? route(RouteSettings settings) {
    switch (settings.name) {
      case PagesNamesConstants.signInPage:
        {
          return routeBuilder(const SignInPage());
        }
      default:
        {
          return routeBuilder(const NoPageFound());
        }
    }
  }
}

dynamic routeBuilder(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}

class NoPageFound extends StatelessWidget {
  const NoPageFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Page not found"),
      ),
      body: const Center(
        child: Text("Page not found"),
      ),
    );
  }
}
