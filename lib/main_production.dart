import 'dart:async';

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

  await SentryFlutter.init(
    (options) {
      options.dsn =
          'https://2cfc7b8ae6d14d8db12cc438e328d599@o4504240542646272.ingest.sentry.io/4504240543563776';
      // Set tracesSampleRate to 1.0 to capture 100% of transactions for performance monitoring.
      // We recommend adjusting this value in production.
      options.tracesSampleRate = .1;
    },
    appRunner: () => runApp(App(environment: AppEnvironment.production)),
  );
}
