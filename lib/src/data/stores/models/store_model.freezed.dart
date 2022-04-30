// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'store_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StoreModel _$StoreModelFromJson(Map<String, dynamic> json) {
  return _StoreModel.fromJson(json);
}

/// @nodoc
mixin _$StoreModel {
// ignore: invalid_annotation_target
  @JsonKey(ignore: true)
  String? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<String> get users => throw _privateConstructorUsedError;
  Map<String, String> get roles => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StoreModelCopyWith<StoreModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoreModelCopyWith<$Res> {
  factory $StoreModelCopyWith(
          StoreModel value, $Res Function(StoreModel) then) =
      _$StoreModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(ignore: true) String? id,
      String name,
      List<String> users,
      Map<String, String> roles,
      DateTime createdAt});
}

/// @nodoc
class _$StoreModelCopyWithImpl<$Res> implements $StoreModelCopyWith<$Res> {
  _$StoreModelCopyWithImpl(this._value, this._then);

  final StoreModel _value;
  // ignore: unused_field
  final $Res Function(StoreModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? users = freezed,
    Object? roles = freezed,
    Object? createdAt = freezed,
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
      users: users == freezed
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<String>,
      roles: roles == freezed
          ? _value.roles
          : roles // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$StoreModelCopyWith<$Res> implements $StoreModelCopyWith<$Res> {
  factory _$StoreModelCopyWith(
          _StoreModel value, $Res Function(_StoreModel) then) =
      __$StoreModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(ignore: true) String? id,
      String name,
      List<String> users,
      Map<String, String> roles,
      DateTime createdAt});
}

/// @nodoc
class __$StoreModelCopyWithImpl<$Res> extends _$StoreModelCopyWithImpl<$Res>
    implements _$StoreModelCopyWith<$Res> {
  __$StoreModelCopyWithImpl(
      _StoreModel _value, $Res Function(_StoreModel) _then)
      : super(_value, (v) => _then(v as _StoreModel));

  @override
  _StoreModel get _value => super._value as _StoreModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? users = freezed,
    Object? roles = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_StoreModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      users: users == freezed
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<String>,
      roles: roles == freezed
          ? _value.roles
          : roles // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_StoreModel extends _StoreModel {
  const _$_StoreModel(
      {@JsonKey(ignore: true) this.id,
      required this.name,
      required final List<String> users,
      required final Map<String, String> roles,
      required this.createdAt})
      : _users = users,
        _roles = roles,
        super._();

  factory _$_StoreModel.fromJson(Map<String, dynamic> json) =>
      _$$_StoreModelFromJson(json);

// ignore: invalid_annotation_target
  @override
  @JsonKey(ignore: true)
  final String? id;
  @override
  final String name;
  final List<String> _users;
  @override
  List<String> get users {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_users);
  }

  final Map<String, String> _roles;
  @override
  Map<String, String> get roles {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_roles);
  }

  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'StoreModel(id: $id, name: $name, users: $users, roles: $roles, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _StoreModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.users, users) &&
            const DeepCollectionEquality().equals(other.roles, roles) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(users),
      const DeepCollectionEquality().hash(roles),
      const DeepCollectionEquality().hash(createdAt));

  @JsonKey(ignore: true)
  @override
  _$StoreModelCopyWith<_StoreModel> get copyWith =>
      __$StoreModelCopyWithImpl<_StoreModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StoreModelToJson(this);
  }
}

abstract class _StoreModel extends StoreModel {
  const factory _StoreModel(
      {@JsonKey(ignore: true) final String? id,
      required final String name,
      required final List<String> users,
      required final Map<String, String> roles,
      required final DateTime createdAt}) = _$_StoreModel;
  const _StoreModel._() : super._();

  factory _StoreModel.fromJson(Map<String, dynamic> json) =
      _$_StoreModel.fromJson;

  @override // ignore: invalid_annotation_target
  @JsonKey(ignore: true)
  String? get id => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  List<String> get users => throw _privateConstructorUsedError;
  @override
  Map<String, String> get roles => throw _privateConstructorUsedError;
  @override
  DateTime get createdAt => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$StoreModelCopyWith<_StoreModel> get copyWith =>
      throw _privateConstructorUsedError;
}
