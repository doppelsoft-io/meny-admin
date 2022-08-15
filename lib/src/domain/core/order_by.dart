class OrderBy {
  const OrderBy(
    this.field, {

    /// Firbase default
    this.descending = true,
    this.sortColumnIndex,
  });

  factory OrderBy.fallback() {
    return const OrderBy('createdAt');
  }

  final String field;
  final bool descending;
  final int? sortColumnIndex;
}
