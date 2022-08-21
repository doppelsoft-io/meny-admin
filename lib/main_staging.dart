import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:meny_admin/app.dart';
import 'package:meny_admin/firebase_options_stg.dart';
import 'package:meny_admin/locator.dart';
import 'package:meny_admin/src/services/services.dart';
import 'package:meny_admin/web_url_strategy.dart';
import 'package:universal_platform/universal_platform.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (UniversalPlatform.isWeb) configureUrl();

  await dotenv.load();

  // GoRouter.setUrlPathStrategy(UrlPathStrategy.path);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await Locator.setup(environment: AppEnvironment.staging);
  await HiveService.configure();

  runApp(App(environment: AppEnvironment.staging));
}
