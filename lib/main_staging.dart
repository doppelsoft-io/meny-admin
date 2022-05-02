import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:meny/app.dart';
import 'package:meny/locator.dart';
import 'package:meny/src/enums/enums.dart';
import 'package:meny/src/services/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await Locator.setup();
  await HiveService.configure();

  runApp(const App(environment: Environment.staging));
}
