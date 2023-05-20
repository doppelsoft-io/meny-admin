import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:doppelsoft_ui/doppelsoft_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meny_admin/locator.dart';
import 'package:meny_admin/navigator.dart';
import 'package:meny_admin/router.dart';
import 'package:meny_admin/src/application/application.dart';
import 'package:meny_admin/themes.dart';

class App extends StatelessWidget {
  App({
    Key? key,
    required this.environment,
  }) : super(key: key);

  final authCubit = Locator.instance<AuthCubit>();
  final flagsmithCubit = Locator.instance<FlagsmithCubit>();

  final AppEnvironment environment;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return OverlaySupport.global(
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthCubit>(
            create: (context) => authCubit..appStarted(),
          ),
          BlocProvider<FlagsmithCubit>(
            create: (context) => flagsmithCubit,
          ),
        ],
        child: MaterialApp.router(
          theme: effectiveTheme.toThemeData(),
          routerConfig: router,
          debugShowCheckedModeBanner: false,
          title: 'Meny',
          builder: (context, widget) => ResponsiveBreakpoints.builder(
            child: BouncingScrollWrapper.builder(
              context,
              DSTheme(
                data: effectiveTheme,
                child: DSUnfocus(
                  child: DSTextScaleFactorClamper(
                    child: widget!,
                  ),
                ),
              ),
            ),
            breakpoints: [
              const Breakpoint(start: 0, end: 450, name: MOBILE),
              const Breakpoint(start: 451, end: 800, name: TABLET),
              const Breakpoint(start: 801, end: 1920, name: DESKTOP),
              const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
            ],
          ),
        ),
      ),
    );
  }
}

class ErrorScreen extends StatelessWidget {
  const ErrorScreen(this.error, {Key? key}) : super(key: key);
  final Exception error;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page Not Found')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SelectableText(error.toString()),
            TextButton(
              onPressed: () => Locator.instance<NavigatorHelper>().goHome(),
              child: const Text('Home'),
            ),
          ],
        ),
      ),
    );
  }
}
