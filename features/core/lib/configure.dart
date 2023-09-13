import 'package:core/dependency_injection.dart';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:presentation/presentation.dart';

Future<void> configureAndStartApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  final directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  configureDependencyInjection();
  runApp(const App());
}
