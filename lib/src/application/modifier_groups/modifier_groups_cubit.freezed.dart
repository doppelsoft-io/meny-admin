// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'modifier_groups_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ModifierGroupsState {
  List<ModifierGroupModel> get groups => throw _privateConstructorUsedError;
  OrderBy get orderBy => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<ModifierGroupModel> groups, OrderBy orderBy)
        loading,
    required TResult Function(List<ModifierGroupModel> groups, OrderBy orderBy)
        loaded,
    required TResult Function(List<ModifierGroupModel> groups, OrderBy orderBy,
            Exception exception)
        error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<ModifierGroupModel> groups, OrderBy orderBy)?
        loading,
    TResult? Function(List<ModifierGroupModel> groups, OrderBy orderBy)? loaded,
    TResult? Function(List<ModifierGroupModel> groups, OrderBy orderBy,
            Exception exception)?
        error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ModifierGroupModel> groups, OrderBy orderBy)? loading,
    TResult Function(List<ModifierGroupModel> groups, OrderBy orderBy)? loaded,
    TResult Function(List<ModifierGroupModel> groups, OrderBy orderBy,
            Exception exception)?
        error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ModifierGroupsStateCopyWith<ModifierGroupsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ModifierGroupsStateCopyWith<$Res> {
  factory $ModifierGroupsStateCopyWith(
          ModifierGroupsState value, $Res Function(ModifierGroupsState) then) =
      _$ModifierGroupsStateCopyWithImpl<$Res, ModifierGroupsState>;
  @useResult
  $Res call({List<ModifierGroupModel> groups, OrderBy orderBy});

  $OrderByCopyWith<$Res> get orderBy;
}

/// @nodoc
class _$ModifierGroupsStateCopyWithImpl<$Res, $Val extends ModifierGroupsState>
    implements $ModifierGroupsStateCopyWith<$Res> {
  _$ModifierGroupsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? groups = null,
    Object? orderBy = null,
  }) {
    return _then(_value.copyWith(
      groups: null == groups
          ? _value.groups
          : groups // ignore: cast_nullable_to_non_nullable
              as List<ModifierGroupModel>,
      orderBy: null == orderBy
          ? _value.orderBy
          : orderBy // ignore: cast_nullable_to_non_nullable
              as OrderBy,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OrderByCopyWith<$Res> get orderBy {
    return $OrderByCopyWith<$Res>(_value.orderBy, (value) {
      return _then(_value.copyWith(orderBy: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_LoadingCopyWith<$Res>
    implements $ModifierGroupsStateCopyWith<$Res> {
  factory _$$_LoadingCopyWith(
          _$_Loading value, $Res Function(_$_Loading) then) =
      __$$_LoadingCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ModifierGroupModel> groups, OrderBy orderBy});

  @override
  $OrderByCopyWith<$Res> get orderBy;
}

/// @nodoc
class __$$_LoadingCopyWithImpl<$Res>
    extends _$ModifierGroupsStateCopyWithImpl<$Res, _$_Loading>
    implements _$$_LoadingCopyWith<$Res> {
  __$$_LoadingCopyWithImpl(_$_Loading _value, $Res Function(_$_Loading) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? groups = null,
    Object? orderBy = null,
  }) {
    return _then(_$_Loading(
      groups: null == groups
          ? _value._groups
          : groups // ignore: cast_nullable_to_non_nullable
              as List<ModifierGroupModel>,
      orderBy: null == orderBy
          ? _value.orderBy
          : orderBy // ignore: cast_nullable_to_non_nullable
              as OrderBy,
    ));
  }
}

/// @nodoc

class _$_Loading implements _Loading {
  const _$_Loading(
      {final List<ModifierGroupModel> groups = const <ModifierGroupModel>[],
      this.orderBy = const OrderBy()})
      : _groups = groups;

  final List<ModifierGroupModel> _groups;
  @override
  @JsonKey()
  List<ModifierGroupModel> get groups {
    if (_groups is EqualUnmodifiableListView) return _groups;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_groups);
  }

  @override
  @JsonKey()
  final OrderBy orderBy;

  @override
  String toString() {
    return 'ModifierGroupsState.loading(groups: $groups, orderBy: $orderBy)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Loading &&
            const DeepCollectionEquality().equals(other._groups, _groups) &&
            (identical(other.orderBy, orderBy) || other.orderBy == orderBy));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_groups), orderBy);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoadingCopyWith<_$_Loading> get copyWith =>
      __$$_LoadingCopyWithImpl<_$_Loading>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<ModifierGroupModel> groups, OrderBy orderBy)
        loading,
    required TResult Function(List<ModifierGroupModel> groups, OrderBy orderBy)
        loaded,
    required TResult Function(List<ModifierGroupModel> groups, OrderBy orderBy,
            Exception exception)
        error,
  }) {
    return loading(groups, orderBy);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<ModifierGroupModel> groups, OrderBy orderBy)?
        loading,
    TResult? Function(List<ModifierGroupModel> groups, OrderBy orderBy)? loaded,
    TResult? Function(List<ModifierGroupModel> groups, OrderBy orderBy,
            Exception exception)?
        error,
  }) {
    return loading?.call(groups, orderBy);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ModifierGroupModel> groups, OrderBy orderBy)? loading,
    TResult Function(List<ModifierGroupModel> groups, OrderBy orderBy)? loaded,
    TResult Function(List<ModifierGroupModel> groups, OrderBy orderBy,
            Exception exception)?
        error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(groups, orderBy);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements ModifierGroupsState {
  const factory _Loading(
      {final List<ModifierGroupModel> groups,
      final OrderBy orderBy}) = _$_Loading;

  @override
  List<ModifierGroupModel> get groups;
  @override
  OrderBy get orderBy;
  @override
  @JsonKey(ignore: true)
  _$$_LoadingCopyWith<_$_Loading> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LoadedCopyWith<$Res>
    implements $ModifierGroupsStateCopyWith<$Res> {
  factory _$$_LoadedCopyWith(_$_Loaded value, $Res Function(_$_Loaded) then) =
      __$$_LoadedCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ModifierGroupModel> groups, OrderBy orderBy});

  @override
  $OrderByCopyWith<$Res> get orderBy;
}

/// @nodoc
class __$$_LoadedCopyWithImpl<$Res>
    extends _$ModifierGroupsStateCopyWithImpl<$Res, _$_Loaded>
    implements _$$_LoadedCopyWith<$Res> {
  __$$_LoadedCopyWithImpl(_$_Loaded _value, $Res Function(_$_Loaded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? groups = null,
    Object? orderBy = null,
  }) {
    return _then(_$_Loaded(
      groups: null == groups
          ? _value._groups
          : groups // ignore: cast_nullable_to_non_nullable
              as List<ModifierGroupModel>,
      orderBy: null == orderBy
          ? _value.orderBy
          : orderBy // ignore: cast_nullable_to_non_nullable
              as OrderBy,
    ));
  }
}

/// @nodoc

class _$_Loaded implements _Loaded {
  const _$_Loaded(
      {required final List<ModifierGroupModel> groups, required this.orderBy})
      : _groups = groups;

  final List<ModifierGroupModel> _groups;
  @override
  List<ModifierGroupModel> get groups {
    if (_groups is EqualUnmodifiableListView) return _groups;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_groups);
  }

  @override
  final OrderBy orderBy;

  @override
  String toString() {
    return 'ModifierGroupsState.loaded(groups: $groups, orderBy: $orderBy)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Loaded &&
            const DeepCollectionEquality().equals(other._groups, _groups) &&
            (identical(other.orderBy, orderBy) || other.orderBy == orderBy));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_groups), orderBy);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoadedCopyWith<_$_Loaded> get copyWith =>
      __$$_LoadedCopyWithImpl<_$_Loaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<ModifierGroupModel> groups, OrderBy orderBy)
        loading,
    required TResult Function(List<ModifierGroupModel> groups, OrderBy orderBy)
        loaded,
    required TResult Function(List<ModifierGroupModel> groups, OrderBy orderBy,
            Exception exception)
        error,
  }) {
    return loaded(groups, orderBy);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<ModifierGroupModel> groups, OrderBy orderBy)?
        loading,
    TResult? Function(List<ModifierGroupModel> groups, OrderBy orderBy)? loaded,
    TResult? Function(List<ModifierGroupModel> groups, OrderBy orderBy,
            Exception exception)?
        error,
  }) {
    return loaded?.call(groups, orderBy);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ModifierGroupModel> groups, OrderBy orderBy)? loading,
    TResult Function(List<ModifierGroupModel> groups, OrderBy orderBy)? loaded,
    TResult Function(List<ModifierGroupModel> groups, OrderBy orderBy,
            Exception exception)?
        error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(groups, orderBy);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements ModifierGroupsState {
  const factory _Loaded(
      {required final List<ModifierGroupModel> groups,
      required final OrderBy orderBy}) = _$_Loaded;

  @override
  List<ModifierGroupModel> get groups;
  @override
  OrderBy get orderBy;
  @override
  @JsonKey(ignore: true)
  _$$_LoadedCopyWith<_$_Loaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ErrorCopyWith<$Res>
    implements $ModifierGroupsStateCopyWith<$Res> {
  factory _$$_ErrorCopyWith(_$_Error value, $Res Function(_$_Error) then) =
      __$$_ErrorCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ModifierGroupModel> groups, OrderBy orderBy, Exception exception});

  @override
  $OrderByCopyWith<$Res> get orderBy;
}

/// @nodoc
class __$$_ErrorCopyWithImpl<$Res>
    extends _$ModifierGroupsStateCopyWithImpl<$Res, _$_Error>
    implements _$$_ErrorCopyWith<$Res> {
  __$$_ErrorCopyWithImpl(_$_Error _value, $Res Function(_$_Error) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? groups = null,
    Object? orderBy = null,
    Object? exception = null,
  }) {
    return _then(_$_Error(
      groups: null == groups
          ? _value._groups
          : groups // ignore: cast_nullable_to_non_nullable
              as List<ModifierGroupModel>,
      orderBy: null == orderBy
          ? _value.orderBy
          : orderBy // ignore: cast_nullable_to_non_nullable
              as OrderBy,
      exception: null == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as Exception,
    ));
  }
}

/// @nodoc

class _$_Error implements _Error {
  const _$_Error(
      {required final List<ModifierGroupModel> groups,
      required this.orderBy,
      required this.exception})
      : _groups = groups;

  final List<ModifierGroupModel> _groups;
  @override
  List<ModifierGroupModel> get groups {
    if (_groups is EqualUnmodifiableListView) return _groups;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_groups);
  }

  @override
  final OrderBy orderBy;
  @override
  final Exception exception;

  @override
  String toString() {
    return 'ModifierGroupsState.error(groups: $groups, orderBy: $orderBy, exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Error &&
            const DeepCollectionEquality().equals(other._groups, _groups) &&
            (identical(other.orderBy, orderBy) || other.orderBy == orderBy) &&
            (identical(other.exception, exception) ||
                other.exception == exception));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_groups), orderBy, exception);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
      __$$_ErrorCopyWithImpl<_$_Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<ModifierGroupModel> groups, OrderBy orderBy)
        loading,
    required TResult Function(List<ModifierGroupModel> groups, OrderBy orderBy)
        loaded,
    required TResult Function(List<ModifierGroupModel> groups, OrderBy orderBy,
            Exception exception)
        error,
  }) {
    return error(groups, orderBy, exception);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<ModifierGroupModel> groups, OrderBy orderBy)?
        loading,
    TResult? Function(List<ModifierGroupModel> groups, OrderBy orderBy)? loaded,
    TResult? Function(List<ModifierGroupModel> groups, OrderBy orderBy,
            Exception exception)?
        error,
  }) {
    return error?.call(groups, orderBy, exception);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ModifierGroupModel> groups, OrderBy orderBy)? loading,
    TResult Function(List<ModifierGroupModel> groups, OrderBy orderBy)? loaded,
    TResult Function(List<ModifierGroupModel> groups, OrderBy orderBy,
            Exception exception)?
        error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(groups, orderBy, exception);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements ModifierGroupsState {
  const factory _Error(
      {required final List<ModifierGroupModel> groups,
      required final OrderBy orderBy,
      required final Exception exception}) = _$_Error;

  @override
  List<ModifierGroupModel> get groups;
  @override
  OrderBy get orderBy;
  Exception get exception;
  @override
  @JsonKey(ignore: true)
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
      throw _privateConstructorUsedError;
}
