import 'package:flutter/material.dart';
import 'package:presentation/src/sign_in/widgets/sign_in_page.dart';
import 'package:presentation/src/sign_up/widgets/sign_up_page.dart';
import 'package:presentation/src/utils/pages_names_constants.dart';
import 'package:presentation/src/widgets/no_page_found_widget.dart';

class OnGenerateRoute {
  static Route<dynamic>? route(RouteSettings settings) {
    switch (settings.name) {
      case PagesNamesConstants.signInPage:
        {
          return routeBuilder(const SignInPage());
        }
      case PagesNamesConstants.signUpPage:
        {
          return routeBuilder(const SignUpPage());
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
