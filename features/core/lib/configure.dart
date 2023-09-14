import 'package:core/dependency_injection.dart';

import 'package:flutter/material.dart';
import 'package:presentation/presentation.dart';

Future<void> configureAndStartApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencyInjection();
  runApp(const App());
}
