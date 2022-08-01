enum StoreRole {
  owner,
}

extension StoreRoleX on StoreRole {
  String asString() {
    switch (this) {
      case StoreRole.owner:
        return 'owner';
    }
  }
}
