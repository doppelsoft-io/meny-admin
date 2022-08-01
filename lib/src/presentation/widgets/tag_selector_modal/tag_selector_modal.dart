import 'package:doppelsoft_ui/doppelsoft_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class TagSelectorModal extends StatelessWidget {
  const TagSelectorModal({Key? key}) : super(key: key);

  static Future<Object?> open(BuildContext context) {
    return showGeneralDialog(
      context: context,
      pageBuilder: (context, anim, anim2) {
        return const _TagSelectorModal();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const _TagSelectorModal();
  }
}

class _TagSelectorModal extends HookWidget {
  const _TagSelectorModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const DSModal(
      child: SingleChildScrollView(
          // child: ListView.builder(
          //   itemBuilder: (context, i) {
          //     return const ListTile();
          //   },
          // ),
          ),
    );
  }
}
