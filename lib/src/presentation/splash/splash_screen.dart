import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meny_admin/src/application/application.dart';
import 'package:meny_admin/src/presentation/presentation.dart';
import 'package:meny_admin/themes.dart';
import 'package:shimmer/shimmer.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static const String routeName = 'splash';

  static Route route() {
    return MaterialPageRoute<Widget>(
      builder: (_) => const SplashScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, authState) {
        // authState.maybeWhen(
        //   authenticated: (_) {
        //     GoRouter.of(context).go(AppScreen.routeName);
        //   },
        //   anonymous: (_) {
        //     print('HERE');
        //     GoRouter.of(context).go(AppScreen.routeName);
        //   },
        //   orElse: () {},
        // );
      },
      child: Scaffold(
        body: Container(
          color: Themes.primaryColor,
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
      ),
    );
  }
}
