import 'package:flutter/material.dart';
import 'package:meny_admin/src/constants/analytics.dart';
import 'package:meny_admin/src/presentation/menus/menus.dart';
import 'package:meny_admin/src/services/services.dart';

class MenusPage extends StatelessWidget {
  const MenusPage({Key? key}) : super(key: key);

  static final _tabs = [
    const Tab(text: 'Menus'),
    const Tab(text: 'Categories'),
    const Tab(text: 'Items'),
    const Tab(text: 'Ingredients'),
    const Tab(text: 'Tags'),
    const Tab(text: 'Modifier Groups'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.grey[50],
          centerTitle: false,
          automaticallyImplyLeading: false,
          flexibleSpace: TabBar(
            onTap: (index) => ActionService.run(
              () => null,
              () => AnalyticsService.track(
                message: Analytics.menusTabTabTapped,
                params: {
                  'tab': _tabs[index].text ?? '',
                },
              ),
            ),
            isScrollable: true,
            indicatorWeight: 4,
            tabs: _tabs,
          ),
        ),
        body: const TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            MenusMenusTab(),
            MenusCategoriesTab(),
            MenusItemsTab(),
            IngredientsTab(),
            TagsTab(),
            ModifierGroupsTab(),
          ],
        ),
      ),
    );
  }
}
