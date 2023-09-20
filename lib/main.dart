import 'package:clean_architecture_template_application/src/dependency_injection.dart';
import 'package:flutter/material.dart';
import 'package:presentation/src/presentation/app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencyInjection();
  runApp(const App());
}
