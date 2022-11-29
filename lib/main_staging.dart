import 'dart:async';

import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:flutter/material.dart';
import 'package:meny_admin/app.dart';
import 'package:meny_admin/firebase_options_stg.dart';
import 'package:meny_admin/locator.dart';
import 'package:meny_admin/src/app/app_constants.dart';
import 'package:meny_admin/web_url_strategy.dart';
import 'package:meny_core/meny_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (UniversalPlatform.isWeb) configureUrl();

  await dotenv.load(fileName: 'env');

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await Locator.setup(environment: AppEnvironment.staging);

  await SentryFlutter.init(
    (options) {
      options
        ..dsn = dotenv.get(AppConstants.sentryDSN)
        ..tracesSampleRate = 0.1;
    },
    appRunner: () => runApp(App(environment: AppEnvironment.staging)),
  );
}
