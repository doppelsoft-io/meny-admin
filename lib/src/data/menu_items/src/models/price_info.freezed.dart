// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'price_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PriceInfo _$PriceInfoFromJson(Map<String, dynamic> json) {
  return _PriceInfo.fromJson(json);
}

/// @nodoc
mixin _$PriceInfo {
  int get price => throw _privateConstructorUsedError;
  List<PriceOverride>? get overrides => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PriceInfoCopyWith<PriceInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PriceInfoCopyWith<$Res> {
  factory $PriceInfoCopyWith(PriceInfo value, $Res Function(PriceInfo) then) =
      _$PriceInfoCopyWithImpl<$Res>;
  $Res call({int price, List<PriceOverride>? overrides});
}

/// @nodoc
class _$PriceInfoCopyWithImpl<$Res> implements $PriceInfoCopyWith<$Res> {
  _$PriceInfoCopyWithImpl(this._value, this._then);

  final PriceInfo _value;
  // ignore: unused_field
  final $Res Function(PriceInfo) _then;

  @override
  $Res call({
    Object? price = freezed,
    Object? overrides = freezed,
  }) {
    return _then(_value.copyWith(
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      overrides: overrides == freezed
          ? _value.overrides
          : overrides // ignore: cast_nullable_to_non_nullable
              as List<PriceOverride>?,
    ));
  }
}

/// @nodoc
abstract class _$$_PriceInfoCopyWith<$Res> implements $PriceInfoCopyWith<$Res> {
  factory _$$_PriceInfoCopyWith(
          _$_PriceInfo value, $Res Function(_$_PriceInfo) then) =
      __$$_PriceInfoCopyWithImpl<$Res>;
  @override
  $Res call({int price, List<PriceOverride>? overrides});
}

/// @nodoc
class __$$_PriceInfoCopyWithImpl<$Res> extends _$PriceInfoCopyWithImpl<$Res>
    implements _$$_PriceInfoCopyWith<$Res> {
  __$$_PriceInfoCopyWithImpl(
      _$_PriceInfo _value, $Res Function(_$_PriceInfo) _then)
      : super(_value, (v) => _then(v as _$_PriceInfo));

  @override
  _$_PriceInfo get _value => super._value as _$_PriceInfo;

  @override
  $Res call({
    Object? price = freezed,
    Object? overrides = freezed,
  }) {
    return _then(_$_PriceInfo(
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      overrides: overrides == freezed
          ? _value._overrides
          : overrides // ignore: cast_nullable_to_non_nullable
              as List<PriceOverride>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_PriceInfo implements _PriceInfo {
  _$_PriceInfo({required this.price, final List<PriceOverride>? overrides})
      : _overrides = overrides;

  factory _$_PriceInfo.fromJson(Map<String, dynamic> json) =>
      _$$_PriceInfoFromJson(json);

  @override
  final int price;
  final List<PriceOverride>? _overrides;
  @override
  List<PriceOverride>? get overrides {
    final value = _overrides;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'PriceInfo(price: $price, overrides: $overrides)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PriceInfo &&
            const DeepCollectionEquality().equals(other.price, price) &&
            const DeepCollectionEquality()
                .equals(other._overrides, _overrides));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(price),
      const DeepCollectionEquality().hash(_overrides));

  @JsonKey(ignore: true)
  @override
  _$$_PriceInfoCopyWith<_$_PriceInfo> get copyWith =>
      __$$_PriceInfoCopyWithImpl<_$_PriceInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PriceInfoToJson(this);
  }
}

abstract class _PriceInfo implements PriceInfo {
  factory _PriceInfo(
      {required final int price,
      final List<PriceOverride>? overrides}) = _$_PriceInfo;

  factory _PriceInfo.fromJson(Map<String, dynamic> json) =
      _$_PriceInfo.fromJson;

  @override
  int get price => throw _privateConstructorUsedError;
  @override
  List<PriceOverride>? get overrides => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_PriceInfoCopyWith<_$_PriceInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
