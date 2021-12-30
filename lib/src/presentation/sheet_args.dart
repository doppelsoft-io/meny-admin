import 'package:meny/src/data/models/resources/i_resource_model.dart';

class SheetArgs<T extends IResourceModel> {
  final IResourceModel resource;
  final bool? isNew;

  IResourceModel get model => resource as T;

  SheetArgs({
    required this.resource,
    this.isNew,
  });
}
