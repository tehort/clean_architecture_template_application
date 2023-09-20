import 'package:core/src/dependency_injection.dart';

import 'package:flutter/material.dart';
import 'package:presentation/src/presentation/app/app.dart';

Future<void> configureAndStartApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencyInjection();
  runApp(const App());
}
