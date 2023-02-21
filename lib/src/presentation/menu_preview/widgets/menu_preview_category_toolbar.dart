import 'package:doppelsoft_ui/doppelsoft_ui.dart';
import 'package:flutter/material.dart';
import 'package:meny_core/meny_core.dart';

class MenuPreviewCategoryToolbar extends HookWidget {
  const MenuPreviewCategoryToolbar({
    super.key,
    required this.category,
    required this.onReorderTapped,
  });

  final CompiledCategoryModel category;
  final VoidCallback onReorderTapped;

  @override
  Widget build(BuildContext context) {
    final isHovered = useState(false);
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (e) => isHovered.value = true,
      onExit: (e) => isHovered.value = false,
      child: Row(
        children: [
          DSText(
            category.name,
            theme: const DSTextThemeData.h2(),
          ),
          const SizedBox(width: DSSpacing.xs),
        ],
      ),
    );
  }
}
