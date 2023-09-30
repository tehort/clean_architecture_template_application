import 'package:app/app.dart';
import 'package:clean_architecture_template_application/src/dependency_injection.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencyInjection();
  runApp(const App());
}
