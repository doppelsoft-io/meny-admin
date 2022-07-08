import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:meny_admin/app.dart';
import 'package:meny_admin/firebase_options_dev.dart';
import 'package:meny_admin/locator.dart';
import 'package:meny_admin/src/services/services.dart';
import 'package:meny_admin/web_url_strategy.dart';
import 'package:universal_platform/universal_platform.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (UniversalPlatform.isWeb) configureUrl();

  // final localhost = UniversalPlatform.isAndroid ? '10.0.2.2' : 'localhost';

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // FirebaseFirestore.instance.settings = Settings(
  //   host: '$localhost:8080',
  //   sslEnabled: false,
  //   persistenceEnabled: false,
  // );

  // FirebaseFunctions.instance.useFunctionsEmulator(localhost, 5001);

  // await FirebaseAuth.instance.useEmulator('http://localhost:9099');

  await Locator.setup();
  await HiveService.configure();

  runApp(const App(environment: AppEnvironment.development));
}
