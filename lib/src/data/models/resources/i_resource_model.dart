import 'package:equatable/equatable.dart';

abstract class IResourceModel extends Equatable {
  final String? id;
  const IResourceModel({
    this.id,
  });

  Map<String, dynamic> toJson();
  String toFriendlyString();

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id];
}
