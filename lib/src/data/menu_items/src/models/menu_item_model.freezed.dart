// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'menu_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MenuItemModel _$MenuItemModelFromJson(Map<String, dynamic> json) {
  return _MenuItemModel.fromJson(json);
}

/// @nodoc
mixin _$MenuItemModel {
// ignore: invalid_annotation_target
  @JsonKey(ignore: true)
  String? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  PriceInfo get priceInfo => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MenuItemModelCopyWith<MenuItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuItemModelCopyWith<$Res> {
  factory $MenuItemModelCopyWith(
          MenuItemModel value, $Res Function(MenuItemModel) then) =
      _$MenuItemModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(ignore: true) String? id,
      String name,
      PriceInfo priceInfo,
      DateTime? createdAt,
      DateTime? updatedAt,
      String description,
      String? imageUrl});

  $PriceInfoCopyWith<$Res> get priceInfo;
}

/// @nodoc
class _$MenuItemModelCopyWithImpl<$Res>
    implements $MenuItemModelCopyWith<$Res> {
  _$MenuItemModelCopyWithImpl(this._value, this._then);

  final MenuItemModel _value;
  // ignore: unused_field
  final $Res Function(MenuItemModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? priceInfo = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? description = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      priceInfo: priceInfo == freezed
          ? _value.priceInfo
          : priceInfo // ignore: cast_nullable_to_non_nullable
              as PriceInfo,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $PriceInfoCopyWith<$Res> get priceInfo {
    return $PriceInfoCopyWith<$Res>(_value.priceInfo, (value) {
      return _then(_value.copyWith(priceInfo: value));
    });
  }
}

/// @nodoc
abstract class _$$_MenuItemModelCopyWith<$Res>
    implements $MenuItemModelCopyWith<$Res> {
  factory _$$_MenuItemModelCopyWith(
          _$_MenuItemModel value, $Res Function(_$_MenuItemModel) then) =
      __$$_MenuItemModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(ignore: true) String? id,
      String name,
      PriceInfo priceInfo,
      DateTime? createdAt,
      DateTime? updatedAt,
      String description,
      String? imageUrl});

  @override
  $PriceInfoCopyWith<$Res> get priceInfo;
}

/// @nodoc
class __$$_MenuItemModelCopyWithImpl<$Res>
    extends _$MenuItemModelCopyWithImpl<$Res>
    implements _$$_MenuItemModelCopyWith<$Res> {
  __$$_MenuItemModelCopyWithImpl(
      _$_MenuItemModel _value, $Res Function(_$_MenuItemModel) _then)
      : super(_value, (v) => _then(v as _$_MenuItemModel));

  @override
  _$_MenuItemModel get _value => super._value as _$_MenuItemModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? priceInfo = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? description = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_$_MenuItemModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      priceInfo: priceInfo == freezed
          ? _value.priceInfo
          : priceInfo // ignore: cast_nullable_to_non_nullable
              as PriceInfo,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_MenuItemModel extends _MenuItemModel {
  const _$_MenuItemModel(
      {@JsonKey(ignore: true) this.id,
      required this.name,
      required this.priceInfo,
      this.createdAt,
      this.updatedAt,
      required this.description,
      this.imageUrl})
      : super._();

  factory _$_MenuItemModel.fromJson(Map<String, dynamic> json) =>
      _$$_MenuItemModelFromJson(json);

// ignore: invalid_annotation_target
  @override
  @JsonKey(ignore: true)
  final String? id;
  @override
  final String name;
  @override
  final PriceInfo priceInfo;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  @override
  final String description;
  @override
  final String? imageUrl;

  @override
  String toString() {
    return 'MenuItemModel(id: $id, name: $name, priceInfo: $priceInfo, createdAt: $createdAt, updatedAt: $updatedAt, description: $description, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MenuItemModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.priceInfo, priceInfo) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.imageUrl, imageUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(priceInfo),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(updatedAt),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(imageUrl));

  @JsonKey(ignore: true)
  @override
  _$$_MenuItemModelCopyWith<_$_MenuItemModel> get copyWith =>
      __$$_MenuItemModelCopyWithImpl<_$_MenuItemModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MenuItemModelToJson(this);
  }
}

abstract class _MenuItemModel extends MenuItemModel {
  const factory _MenuItemModel(
      {@JsonKey(ignore: true) final String? id,
      required final String name,
      required final PriceInfo priceInfo,
      final DateTime? createdAt,
      final DateTime? updatedAt,
      required final String description,
      final String? imageUrl}) = _$_MenuItemModel;
  const _MenuItemModel._() : super._();

  factory _MenuItemModel.fromJson(Map<String, dynamic> json) =
      _$_MenuItemModel.fromJson;

  @override // ignore: invalid_annotation_target
  @JsonKey(ignore: true)
  String? get id => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  PriceInfo get priceInfo => throw _privateConstructorUsedError;
  @override
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @override
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @override
  String get description => throw _privateConstructorUsedError;
  @override
  String? get imageUrl => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_MenuItemModelCopyWith<_$_MenuItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}
