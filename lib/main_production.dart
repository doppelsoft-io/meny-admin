import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:meny_admin/app.dart';
import 'package:meny_admin/locator.dart';
import 'package:meny_admin/src/enums/enums.dart';
import 'package:meny_admin/src/services/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await Locator.setup();
  await HiveService.configure();

  runApp(const App(environment: Environment.production));
}
