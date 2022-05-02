import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meny/src/custom_router.dart';
import 'package:meny/src/data/auth/auth.dart';
import 'package:meny/src/data/stores/stores.dart';
import 'package:meny/src/enums/enums.dart';
import 'package:meny/src/screens/screens.dart';
import 'package:meny/themes.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:responsive_framework/responsive_framework.dart';

class App extends StatelessWidget {
  final Environment environment;
  const App({
    Key? key,
    required this.environment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return OverlaySupport.global(
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthCubit>(
            create: (context) => AuthCubit()..appStarted(),
          ),
          BlocProvider<StoreCubit>(
            create: (context) => StoreCubit(),
          ),
        ],
        child: MaterialApp(
          theme: Themes.defaultTheme,
          builder: (context, widget) => TextScaleFactorClamper(
            child: ResponsiveWrapper.builder(
              widget,
              maxWidth: 1600,
              defaultScale: true,
              breakpoints: const [
                ResponsiveBreakpoint.resize(450, name: MOBILE),
                ResponsiveBreakpoint.autoScale(800, name: TABLET),
                ResponsiveBreakpoint.autoScale(1200, name: TABLET),
                ResponsiveBreakpoint.resize(1400, name: DESKTOP),
                ResponsiveBreakpoint.autoScale(2460, name: '4K'),
              ],
              background: Container(
                color: Colors.white,
              ),
            ),
          ),
          onGenerateRoute: CustomRouter.onGenerateRoute,
          initialRoute: SplashScreen.routeName,
        ),
      ),
    );
  }
}
