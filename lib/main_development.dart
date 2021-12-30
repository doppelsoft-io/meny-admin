import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:meny/app.dart';
import 'package:meny/locator.dart';
import 'package:meny/src/enums/enums.dart';
import 'package:universal_platform/universal_platform.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final localhost = UniversalPlatform.isAndroid ? '10.0.2.2' : 'localhost';

  await Firebase.initializeApp();

  FirebaseFirestore.instance.settings = Settings(
    host: '$localhost:8080',
    sslEnabled: false,
    persistenceEnabled: false,
  );

  FirebaseFunctions.instance.useFunctionsEmulator(localhost, 5001);

  FirebaseAuth.instance.useEmulator('http://localhost:9099');

  await Locator.setup();

  runApp(App(environment: Environment.development));
}
