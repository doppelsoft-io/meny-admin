import 'package:flutter/material.dart';
import 'package:meny/src/constants/spacing.dart';

class DeveloperPage extends StatelessWidget {
  const DeveloperPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Spacing.pageSpacing),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Theme.of(context).errorColor,
            ),
            onPressed: () {},
            child: const Text('Delete all store data'),
          ),
        ],
      ),
    );
  }
}
