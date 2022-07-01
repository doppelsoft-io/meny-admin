import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meny_admin/src/data/auth/auth.dart';
import 'package:meny_admin/src/presentation/shared/shared.dart';
import 'package:meny_admin/src/screens/screens.dart';
import 'package:meny_admin/themes.dart';
import 'package:shimmer/shimmer.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static const String routeName = '/splash';

  static Route route() {
    return MaterialPageRoute<Widget>(
      builder: (_) => const SplashScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, authState) {
        authState.maybeWhen(
          authenticated: (_) {
            Timer(const Duration(seconds: 1), () {
              Navigator.of(context).pushReplacementNamed(AppScreen.routeName);
            });
          },
          anonymous: (_) {
            Timer(const Duration(seconds: 1), () {
              Navigator.of(context).pushReplacementNamed(AppScreen.routeName);
            });
          },
          orElse: () {},
        );
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
