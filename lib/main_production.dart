import 'dart:async';
import 'dart:developer';

import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:flutter/material.dart';
import 'package:meny_admin/app.dart';
import 'package:meny_admin/firebase_options_prod.dart';
import 'package:meny_admin/locator.dart';
import 'package:meny_admin/web_url_strategy.dart';
import 'package:meny_core/meny_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (UniversalPlatform.isWeb) configureUrl();

  await dotenv.load(fileName: 'env');

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await Locator.setup(environment: AppEnvironment.production);

  runZonedGuarded(
    () {
      runApp(App(environment: AppEnvironment.production));
    },
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
