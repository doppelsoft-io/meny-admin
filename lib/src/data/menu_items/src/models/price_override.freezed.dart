// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'price_override.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PriceOverride _$PriceOverrideFromJson(Map<String, dynamic> json) {
  return _PriceOverride.fromJson(json);
}

/// @nodoc
mixin _$PriceOverride {
  int get price => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PriceOverrideCopyWith<PriceOverride> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PriceOverrideCopyWith<$Res> {
  factory $PriceOverrideCopyWith(
          PriceOverride value, $Res Function(PriceOverride) then) =
      _$PriceOverrideCopyWithImpl<$Res>;
  $Res call({int price});
}

/// @nodoc
class _$PriceOverrideCopyWithImpl<$Res>
    implements $PriceOverrideCopyWith<$Res> {
  _$PriceOverrideCopyWithImpl(this._value, this._then);

  final PriceOverride _value;
  // ignore: unused_field
  final $Res Function(PriceOverride) _then;

  @override
  $Res call({
    Object? price = freezed,
  }) {
    return _then(_value.copyWith(
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_PriceOverrideCopyWith<$Res>
    implements $PriceOverrideCopyWith<$Res> {
  factory _$$_PriceOverrideCopyWith(
          _$_PriceOverride value, $Res Function(_$_PriceOverride) then) =
      __$$_PriceOverrideCopyWithImpl<$Res>;
  @override
  $Res call({int price});
}

/// @nodoc
class __$$_PriceOverrideCopyWithImpl<$Res>
    extends _$PriceOverrideCopyWithImpl<$Res>
    implements _$$_PriceOverrideCopyWith<$Res> {
  __$$_PriceOverrideCopyWithImpl(
      _$_PriceOverride _value, $Res Function(_$_PriceOverride) _then)
      : super(_value, (v) => _then(v as _$_PriceOverride));

  @override
  _$_PriceOverride get _value => super._value as _$_PriceOverride;

  @override
  $Res call({
    Object? price = freezed,
  }) {
    return _then(_$_PriceOverride(
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_PriceOverride implements _PriceOverride {
  _$_PriceOverride({required this.price});

  factory _$_PriceOverride.fromJson(Map<String, dynamic> json) =>
      _$$_PriceOverrideFromJson(json);

  @override
  final int price;

  @override
  String toString() {
    return 'PriceOverride(price: $price)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PriceOverride &&
            const DeepCollectionEquality().equals(other.price, price));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(price));

  @JsonKey(ignore: true)
  @override
  _$$_PriceOverrideCopyWith<_$_PriceOverride> get copyWith =>
      __$$_PriceOverrideCopyWithImpl<_$_PriceOverride>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PriceOverrideToJson(this);
  }
}

abstract class _PriceOverride implements PriceOverride {
  factory _PriceOverride({required final int price}) = _$_PriceOverride;

  factory _PriceOverride.fromJson(Map<String, dynamic> json) =
      _$_PriceOverride.fromJson;

  @override
  int get price => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_PriceOverrideCopyWith<_$_PriceOverride> get copyWith =>
      throw _privateConstructorUsedError;
}
