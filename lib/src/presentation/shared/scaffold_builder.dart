import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:flutter/material.dart';
import 'package:meny_admin/src/presentation/shared/shared.dart';

class ScaffoldBuilder extends StatelessWidget {
  const ScaffoldBuilder({
    Key? key,
    required this.appBar,
    required this.body,
  }) : super(key: key);

  factory ScaffoldBuilder.error({required Exception exception}) {
    return ScaffoldBuilder(
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
      ),
      body: ErrorDisplay(
        exception: CustomException(message: exception.toString()),
      ),
    );
  }

  factory ScaffoldBuilder.loading() {
    return ScaffoldBuilder(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: false,
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
      ),
      body: const Center(child: CircularProgressIndicator()),
    );
  }

  final AppBar appBar;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: body,
    );
  }
}
