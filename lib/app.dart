import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:doppelsoft_ui/doppelsoft_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meny_admin/go_router.dart';
import 'package:meny_admin/src/data/auth/auth.dart';
import 'package:meny_admin/src/data/stores/stores.dart';
import 'package:meny_admin/themes.dart';
import 'package:meny_admin/unfocus.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:responsive_framework/responsive_framework.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
    required this.environment,
  }) : super(key: key);

  final AppEnvironment environment;

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
        child: MaterialApp.router(
          routeInformationProvider: router.routeInformationProvider,
          routeInformationParser: router.routeInformationParser,
          routerDelegate: router.routerDelegate,
          theme: Themes.defaultTheme,
          debugShowCheckedModeBanner: false,
          builder: (context, widget) => ResponsiveWrapper.builder(
            BouncingScrollWrapper.builder(
              context,
              DSUnfocus(
                child: DSTextScaleFactorClamper(
                  child: Unfocus(child: widget!),
                ),
              ),
            ),
            minWidth: 480,
            defaultScale: true,
            breakpoints: [
              const ResponsiveBreakpoint.resize(480, name: MOBILE),
              const ResponsiveBreakpoint.autoScale(800, name: TABLET),
              const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
              const ResponsiveBreakpoint.autoScale(2460, name: '4K'),
            ],
            background: Container(
              color: Colors.white,
            ),
          ),
          // onGenerateRoute: CustomRouter.onGenerateRoute,
          // initialRoute: SplashScreen.routeName,
        ),
      ),
    );
  }
}
