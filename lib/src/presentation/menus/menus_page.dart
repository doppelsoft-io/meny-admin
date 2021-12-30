import 'package:flutter/material.dart';
import 'package:meny/src/presentation/menus/categories/categories_tab.dart';
import 'package:meny/src/presentation/menus/items/items_tab.dart';
import 'package:meny/src/presentation/menus/menus/menus_tab.dart';

class MenusPage extends StatelessWidget {
  const MenusPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.grey[50],
          centerTitle: false,
          automaticallyImplyLeading: false,
          flexibleSpace: const TabBar(
            isScrollable: true,
            indicatorWeight: 4,
            tabs: [
              Tab(text: 'Menus'),
              Tab(text: 'Categories'),
              Tab(text: 'Items'),
              Tab(text: 'Modifiers'),
            ],
          ),
        ),
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            MenusMenusTab.page(),
            MenusCategoriesTab.page(),
            MenusItemsTab.page(),
            const Icon(Icons.directions_bike),
          ],
        ),
      ),
    );
  }
}
