class SheetArgs<T> {
  SheetArgs({
    required this.resource,
    this.isNew,
  });

  final T resource;
  final bool? isNew;

  T get model => resource;
}
