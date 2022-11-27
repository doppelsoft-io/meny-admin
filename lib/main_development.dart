import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meny_admin/app.dart';
import 'package:meny_admin/firebase_options_dev.dart';
import 'package:meny_admin/locator.dart';
import 'package:meny_admin/src/services/services.dart';
import 'package:meny_admin/web_url_strategy.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (UniversalPlatform.isWeb) configureUrl();

  await dotenv.load(fileName: 'env');

  // final localhost = UniversalPlatform.isAndroid ? '10.0.2.2' : 'localhost';

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // FirebaseFirestore.instance.settings = Settings(
  //   host: '$localhost:8080',
  //   sslEnabled: false,
  //   persistenceEnabled: false,
  // );

  if (kIsWeb) {
    await FirebaseFirestore.instance
        .enablePersistence(const PersistenceSettings(synchronizeTabs: true));
  }

  // FirebaseFunctions.instance.useFunctionsEmulator(localhost, 5001);

  // await FirebaseAuth.instance.useAuthEmulator(localhost, 9099);

  await Locator.setup(environment: AppEnvironment.development);
  await HiveService.configure();

  runZonedGuarded(
    () {
      runApp(App(environment: AppEnvironment.development));
    },
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
