import 'package:flutter/material.dart';

class SaveMenuButton extends StatelessWidget {
  const SaveMenuButton({
    Key? key,
    required this.onSave,
  }) : super(key: key);

  final Function(BuildContext) onSave;

  @override
  Widget build(BuildContext context) {
    return Center(child: _SaveMenuButton(onSave: onSave));
  }
}

class _SaveMenuButton extends StatelessWidget {
  const _SaveMenuButton({
    Key? key,
    required this.onSave,
  }) : super(key: key);

  final Function(BuildContext) onSave;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onSave(context),
      child: const Text('Save'),
    );
  }
}
