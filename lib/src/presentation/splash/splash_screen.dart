import 'package:doppelsoft_ui/doppelsoft_ui.dart';
import 'package:flutter/material.dart';
import 'package:meny_admin/src/presentation/presentation.dart';
import 'package:meny_admin/themes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static const String routeName = 'splash';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: effectiveTheme.colorScheme.primary,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Shimmer.fromColors(
              baseColor: Colors.green.shade100,
              highlightColor: Colors.white,
              child: Text(
                'Meny',
                style: Theme.of(context)
                    .textTheme
                    .headline1
                    ?.copyWith(color: Colors.white),
              ),
            ),
            const LoadingDisplay(adaptive: true),
          ],
        ),
      ),
    );
  }
}
