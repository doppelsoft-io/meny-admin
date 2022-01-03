import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meny/src/constants/paths.dart';

extension FirebaseFirestoreX on FirebaseFirestore {
  CollectionReference usersCollection() => collection(Paths.users);

  DocumentReference usersDocument({
    required String userId,
  }) =>
      collection(Paths.users).doc(userId);

  CollectionReference storesCollection() => collection(Paths.stores);

  DocumentReference storesDocument({
    required String storeId,
  }) =>
      storesCollection().doc(storeId);

  CollectionReference menuEntitiesCollection({
    required String storeId,
  }) =>
      storesDocument(storeId: storeId).collection(Paths.menus);

  DocumentReference menuEntitiesDocument({
    required String storeId,
    required String menuId,
  }) =>
      menuEntitiesCollection(storeId: storeId).doc(menuId);

  CollectionReference categoryEntitiesCollection({
    required String storeId,
  }) =>
      storesDocument(storeId: storeId).collection(Paths.categories);

  DocumentReference categoryEntitiesDocument({
    required String storeId,
    required String categoryId,
  }) =>
      categoryEntitiesCollection(storeId: storeId).doc(categoryId);

  CollectionReference menuItemEntitiesCollection({
    required String storeId,
  }) =>
      storesDocument(storeId: storeId).collection(Paths.menuItems);

  DocumentReference menuItemEntitiesDocument({
    required String storeId,
    required String itemId,
  }) =>
      menuItemEntitiesCollection(storeId: storeId).doc(itemId);

  CollectionReference compiledMenusCollection({
    required String storeId,
  }) =>
      storesDocument(storeId: storeId).collection(Paths.menus);

  DocumentReference compiledMenusDocument({
    required String storeId,
    required String menuId,
  }) =>
      compiledMenusCollection(storeId: storeId).doc(menuId);

  CollectionReference compiledCategoriesCollection({
    required String storeId,
    required String menuId,
  }) =>
      compiledMenusDocument(
        storeId: storeId,
        menuId: menuId,
      ).collection(Paths.categories);

  DocumentReference compiledCategoriesDocument({
    required String storeId,
    required String menuId,
    required String categoryId,
  }) =>
      compiledCategoriesCollection(
        storeId: storeId,
        menuId: menuId,
      ).doc(categoryId);

  CollectionReference compiledMenuItemsCollection({
    required String storeId,
    required String menuId,
    required String categoryId,
  }) =>
      compiledCategoriesDocument(
        storeId: storeId,
        menuId: menuId,
        categoryId: categoryId,
      ).collection(Paths.menuItems);

  DocumentReference compiledMenuItemsDocument({
    required String storeId,
    required String menuId,
    required String categoryId,
    required String itemId,
  }) =>
      compiledMenuItemsCollection(
        storeId: storeId,
        menuId: menuId,
        categoryId: categoryId,
      ).doc(itemId);
}
