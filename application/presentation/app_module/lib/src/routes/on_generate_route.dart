import 'package:authentication_module/authentication_module.dart';
import 'package:flutter/material.dart';
import 'package:purple_ui/purple_ui.dart';

class OnGenerateRoute {
  static Route<dynamic>? route(RouteSettings settings) {
    switch (settings.name) {
      case PagesNameConstants.signInPage:
        {
          return routeBuilder(const SignUpPage());
        }
      case PagesNameConstants.signUpPage:
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
