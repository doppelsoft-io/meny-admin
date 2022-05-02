class SheetArgs<T> {
  final T resource;
  final bool? isNew;

  T get model => resource;

  SheetArgs({
    required this.resource,
    this.isNew,
  });
}
