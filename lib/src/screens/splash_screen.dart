import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meny/src/data/auth/auth.dart';
import 'package:meny/src/presentation/shared/shared.dart';
import 'package:meny/src/screens/screens.dart';
import 'package:meny/themes.dart';
import 'package:shimmer/shimmer.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = '/splash';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => SplashScreen(),
    );
  }

  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listenWhen: (prev, curr) => prev.status == AuthStatus.initial,
      listener: (context, authState) {
        if (authState.status == AuthStatus.anonymous ||
            authState.status == AuthStatus.authenticated) {
          Timer(Duration(seconds: 1), () {
            Navigator.of(context).pushNamed(AppScreen.routeName);
          });
        }
      },
      child: Scaffold(
        body: Container(
          color: Themes.primaryColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Shimmer.fromColors(
                child: Text(
                  'Meny',
                  style: Theme.of(context)
                      .textTheme
                      .headline1
                      ?.copyWith(color: Colors.white),
                ),
                baseColor: Colors.green.shade100,
                highlightColor: Colors.white,
              ),
              LoadingDisplay(adaptive: true),
            ],
          ),
        ),
      ),
    );
  }
}
