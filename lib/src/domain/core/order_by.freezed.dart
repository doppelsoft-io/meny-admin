// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_by.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OrderBy {
  String get field => throw _privateConstructorUsedError;
  bool get descending => throw _privateConstructorUsedError;
  int? get sortColumnIndex => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrderByCopyWith<OrderBy> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderByCopyWith<$Res> {
  factory $OrderByCopyWith(OrderBy value, $Res Function(OrderBy) then) =
      _$OrderByCopyWithImpl<$Res, OrderBy>;
  @useResult
  $Res call({String field, bool descending, int? sortColumnIndex});
}

/// @nodoc
class _$OrderByCopyWithImpl<$Res, $Val extends OrderBy>
    implements $OrderByCopyWith<$Res> {
  _$OrderByCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field = null,
    Object? descending = null,
    Object? sortColumnIndex = freezed,
  }) {
    return _then(_value.copyWith(
      field: null == field
          ? _value.field
          : field // ignore: cast_nullable_to_non_nullable
              as String,
      descending: null == descending
          ? _value.descending
          : descending // ignore: cast_nullable_to_non_nullable
              as bool,
      sortColumnIndex: freezed == sortColumnIndex
          ? _value.sortColumnIndex
          : sortColumnIndex // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OrderByCopyWith<$Res> implements $OrderByCopyWith<$Res> {
  factory _$$_OrderByCopyWith(
          _$_OrderBy value, $Res Function(_$_OrderBy) then) =
      __$$_OrderByCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String field, bool descending, int? sortColumnIndex});
}

/// @nodoc
class __$$_OrderByCopyWithImpl<$Res>
    extends _$OrderByCopyWithImpl<$Res, _$_OrderBy>
    implements _$$_OrderByCopyWith<$Res> {
  __$$_OrderByCopyWithImpl(_$_OrderBy _value, $Res Function(_$_OrderBy) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field = null,
    Object? descending = null,
    Object? sortColumnIndex = freezed,
  }) {
    return _then(_$_OrderBy(
      field: null == field
          ? _value.field
          : field // ignore: cast_nullable_to_non_nullable
              as String,
      descending: null == descending
          ? _value.descending
          : descending // ignore: cast_nullable_to_non_nullable
              as bool,
      sortColumnIndex: freezed == sortColumnIndex
          ? _value.sortColumnIndex
          : sortColumnIndex // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$_OrderBy implements _OrderBy {
  const _$_OrderBy(
      {this.field = 'createdAt', this.descending = true, this.sortColumnIndex});

  @override
  @JsonKey()
  final String field;
  @override
  @JsonKey()
  final bool descending;
  @override
  final int? sortColumnIndex;

  @override
  String toString() {
    return 'OrderBy(field: $field, descending: $descending, sortColumnIndex: $sortColumnIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderBy &&
            (identical(other.field, field) || other.field == field) &&
            (identical(other.descending, descending) ||
                other.descending == descending) &&
            (identical(other.sortColumnIndex, sortColumnIndex) ||
                other.sortColumnIndex == sortColumnIndex));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, field, descending, sortColumnIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrderByCopyWith<_$_OrderBy> get copyWith =>
      __$$_OrderByCopyWithImpl<_$_OrderBy>(this, _$identity);
}

abstract class _OrderBy implements OrderBy {
  const factory _OrderBy(
      {final String field,
      final bool descending,
      final int? sortColumnIndex}) = _$_OrderBy;

  @override
  String get field;
  @override
  bool get descending;
  @override
  int? get sortColumnIndex;
  @override
  @JsonKey(ignore: true)
  _$$_OrderByCopyWith<_$_OrderBy> get copyWith =>
      throw _privateConstructorUsedError;
}
