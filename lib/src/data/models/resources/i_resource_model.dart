import 'package:equatable/equatable.dart';

abstract class IResourceModel extends Equatable {
  const IResourceModel({
    this.id,
  });

  final String? id;

  Map<String, dynamic> toJson();
  String toFriendlyString();

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id];
}
