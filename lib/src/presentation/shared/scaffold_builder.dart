import 'package:flutter/material.dart';
import 'package:meny/src/data/core/failures.dart';
import 'package:meny/src/presentation/shared/shared.dart';

class ScaffoldBuilder extends StatelessWidget {
  const ScaffoldBuilder({
    Key? key,
    required this.appBar,
    required this.body,
  }) : super(key: key);

  final AppBar appBar;
  final Widget body;

  factory ScaffoldBuilder.error({required Exception exception}) {
    return ScaffoldBuilder(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: true,
        centerTitle: false,
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
      ),
      body: ErrorDisplay(
        failure: Failure(message: exception.toString()),
      ),
    );
  }

  factory ScaffoldBuilder.loading() {
    return ScaffoldBuilder(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: true,
        centerTitle: false,
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
      ),
      body: Center(child: CircularProgressIndicator()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: body,
    );
  }
}
