import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:meny/app.dart';
import 'package:meny/locator.dart';
import 'package:meny/src/enums/enums.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await Locator.setup();

  runApp(App(environment: Environment.production));
}
