// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'menus_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MenusState {
  List<MenuModel> get menus => throw _privateConstructorUsedError;
  OrderBy get orderBy => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<MenuModel> menus, OrderBy orderBy) loading,
    required TResult Function(List<MenuModel> menus, OrderBy orderBy) loaded,
    required TResult Function(
            List<MenuModel> menus, Exception exception, OrderBy orderBy)
        error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<MenuModel> menus, OrderBy orderBy)? loading,
    TResult? Function(List<MenuModel> menus, OrderBy orderBy)? loaded,
    TResult? Function(
            List<MenuModel> menus, Exception exception, OrderBy orderBy)?
        error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<MenuModel> menus, OrderBy orderBy)? loading,
    TResult Function(List<MenuModel> menus, OrderBy orderBy)? loaded,
    TResult Function(
            List<MenuModel> menus, Exception exception, OrderBy orderBy)?
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
  $MenusStateCopyWith<MenusState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenusStateCopyWith<$Res> {
  factory $MenusStateCopyWith(
          MenusState value, $Res Function(MenusState) then) =
      _$MenusStateCopyWithImpl<$Res, MenusState>;
  @useResult
  $Res call({List<MenuModel> menus, OrderBy orderBy});

  $OrderByCopyWith<$Res> get orderBy;
}

/// @nodoc
class _$MenusStateCopyWithImpl<$Res, $Val extends MenusState>
    implements $MenusStateCopyWith<$Res> {
  _$MenusStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? menus = null,
    Object? orderBy = null,
  }) {
    return _then(_value.copyWith(
      menus: null == menus
          ? _value.menus
          : menus // ignore: cast_nullable_to_non_nullable
              as List<MenuModel>,
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
abstract class _$$_LoadingCopyWith<$Res> implements $MenusStateCopyWith<$Res> {
  factory _$$_LoadingCopyWith(
          _$_Loading value, $Res Function(_$_Loading) then) =
      __$$_LoadingCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<MenuModel> menus, OrderBy orderBy});

  @override
  $OrderByCopyWith<$Res> get orderBy;
}

/// @nodoc
class __$$_LoadingCopyWithImpl<$Res>
    extends _$MenusStateCopyWithImpl<$Res, _$_Loading>
    implements _$$_LoadingCopyWith<$Res> {
  __$$_LoadingCopyWithImpl(_$_Loading _value, $Res Function(_$_Loading) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? menus = null,
    Object? orderBy = null,
  }) {
    return _then(_$_Loading(
      menus: null == menus
          ? _value._menus
          : menus // ignore: cast_nullable_to_non_nullable
              as List<MenuModel>,
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
      {final List<MenuModel> menus = const <MenuModel>[],
      this.orderBy = const OrderBy()})
      : _menus = menus;

  final List<MenuModel> _menus;
  @override
  @JsonKey()
  List<MenuModel> get menus {
    if (_menus is EqualUnmodifiableListView) return _menus;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_menus);
  }

  @override
  @JsonKey()
  final OrderBy orderBy;

  @override
  String toString() {
    return 'MenusState.loading(menus: $menus, orderBy: $orderBy)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Loading &&
            const DeepCollectionEquality().equals(other._menus, _menus) &&
            (identical(other.orderBy, orderBy) || other.orderBy == orderBy));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_menus), orderBy);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoadingCopyWith<_$_Loading> get copyWith =>
      __$$_LoadingCopyWithImpl<_$_Loading>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<MenuModel> menus, OrderBy orderBy) loading,
    required TResult Function(List<MenuModel> menus, OrderBy orderBy) loaded,
    required TResult Function(
            List<MenuModel> menus, Exception exception, OrderBy orderBy)
        error,
  }) {
    return loading(menus, orderBy);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<MenuModel> menus, OrderBy orderBy)? loading,
    TResult? Function(List<MenuModel> menus, OrderBy orderBy)? loaded,
    TResult? Function(
            List<MenuModel> menus, Exception exception, OrderBy orderBy)?
        error,
  }) {
    return loading?.call(menus, orderBy);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<MenuModel> menus, OrderBy orderBy)? loading,
    TResult Function(List<MenuModel> menus, OrderBy orderBy)? loaded,
    TResult Function(
            List<MenuModel> menus, Exception exception, OrderBy orderBy)?
        error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(menus, orderBy);
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

abstract class _Loading implements MenusState {
  const factory _Loading({final List<MenuModel> menus, final OrderBy orderBy}) =
      _$_Loading;

  @override
  List<MenuModel> get menus;
  @override
  OrderBy get orderBy;
  @override
  @JsonKey(ignore: true)
  _$$_LoadingCopyWith<_$_Loading> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LoadedCopyWith<$Res> implements $MenusStateCopyWith<$Res> {
  factory _$$_LoadedCopyWith(_$_Loaded value, $Res Function(_$_Loaded) then) =
      __$$_LoadedCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<MenuModel> menus, OrderBy orderBy});

  @override
  $OrderByCopyWith<$Res> get orderBy;
}

/// @nodoc
class __$$_LoadedCopyWithImpl<$Res>
    extends _$MenusStateCopyWithImpl<$Res, _$_Loaded>
    implements _$$_LoadedCopyWith<$Res> {
  __$$_LoadedCopyWithImpl(_$_Loaded _value, $Res Function(_$_Loaded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? menus = null,
    Object? orderBy = null,
  }) {
    return _then(_$_Loaded(
      menus: null == menus
          ? _value._menus
          : menus // ignore: cast_nullable_to_non_nullable
              as List<MenuModel>,
      orderBy: null == orderBy
          ? _value.orderBy
          : orderBy // ignore: cast_nullable_to_non_nullable
              as OrderBy,
    ));
  }
}

/// @nodoc

class _$_Loaded implements _Loaded {
  const _$_Loaded({required final List<MenuModel> menus, required this.orderBy})
      : _menus = menus;

  final List<MenuModel> _menus;
  @override
  List<MenuModel> get menus {
    if (_menus is EqualUnmodifiableListView) return _menus;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_menus);
  }

  @override
  final OrderBy orderBy;

  @override
  String toString() {
    return 'MenusState.loaded(menus: $menus, orderBy: $orderBy)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Loaded &&
            const DeepCollectionEquality().equals(other._menus, _menus) &&
            (identical(other.orderBy, orderBy) || other.orderBy == orderBy));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_menus), orderBy);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoadedCopyWith<_$_Loaded> get copyWith =>
      __$$_LoadedCopyWithImpl<_$_Loaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<MenuModel> menus, OrderBy orderBy) loading,
    required TResult Function(List<MenuModel> menus, OrderBy orderBy) loaded,
    required TResult Function(
            List<MenuModel> menus, Exception exception, OrderBy orderBy)
        error,
  }) {
    return loaded(menus, orderBy);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<MenuModel> menus, OrderBy orderBy)? loading,
    TResult? Function(List<MenuModel> menus, OrderBy orderBy)? loaded,
    TResult? Function(
            List<MenuModel> menus, Exception exception, OrderBy orderBy)?
        error,
  }) {
    return loaded?.call(menus, orderBy);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<MenuModel> menus, OrderBy orderBy)? loading,
    TResult Function(List<MenuModel> menus, OrderBy orderBy)? loaded,
    TResult Function(
            List<MenuModel> menus, Exception exception, OrderBy orderBy)?
        error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(menus, orderBy);
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

abstract class _Loaded implements MenusState {
  const factory _Loaded(
      {required final List<MenuModel> menus,
      required final OrderBy orderBy}) = _$_Loaded;

  @override
  List<MenuModel> get menus;
  @override
  OrderBy get orderBy;
  @override
  @JsonKey(ignore: true)
  _$$_LoadedCopyWith<_$_Loaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ErrorCopyWith<$Res> implements $MenusStateCopyWith<$Res> {
  factory _$$_ErrorCopyWith(_$_Error value, $Res Function(_$_Error) then) =
      __$$_ErrorCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<MenuModel> menus, Exception exception, OrderBy orderBy});

  @override
  $OrderByCopyWith<$Res> get orderBy;
}

/// @nodoc
class __$$_ErrorCopyWithImpl<$Res>
    extends _$MenusStateCopyWithImpl<$Res, _$_Error>
    implements _$$_ErrorCopyWith<$Res> {
  __$$_ErrorCopyWithImpl(_$_Error _value, $Res Function(_$_Error) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? menus = null,
    Object? exception = null,
    Object? orderBy = null,
  }) {
    return _then(_$_Error(
      menus: null == menus
          ? _value._menus
          : menus // ignore: cast_nullable_to_non_nullable
              as List<MenuModel>,
      exception: null == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as Exception,
      orderBy: null == orderBy
          ? _value.orderBy
          : orderBy // ignore: cast_nullable_to_non_nullable
              as OrderBy,
    ));
  }
}

/// @nodoc

class _$_Error implements _Error {
  const _$_Error(
      {required final List<MenuModel> menus,
      required this.exception,
      required this.orderBy})
      : _menus = menus;

  final List<MenuModel> _menus;
  @override
  List<MenuModel> get menus {
    if (_menus is EqualUnmodifiableListView) return _menus;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_menus);
  }

  @override
  final Exception exception;
  @override
  final OrderBy orderBy;

  @override
  String toString() {
    return 'MenusState.error(menus: $menus, exception: $exception, orderBy: $orderBy)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Error &&
            const DeepCollectionEquality().equals(other._menus, _menus) &&
            (identical(other.exception, exception) ||
                other.exception == exception) &&
            (identical(other.orderBy, orderBy) || other.orderBy == orderBy));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_menus), exception, orderBy);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
      __$$_ErrorCopyWithImpl<_$_Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<MenuModel> menus, OrderBy orderBy) loading,
    required TResult Function(List<MenuModel> menus, OrderBy orderBy) loaded,
    required TResult Function(
            List<MenuModel> menus, Exception exception, OrderBy orderBy)
        error,
  }) {
    return error(menus, exception, orderBy);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<MenuModel> menus, OrderBy orderBy)? loading,
    TResult? Function(List<MenuModel> menus, OrderBy orderBy)? loaded,
    TResult? Function(
            List<MenuModel> menus, Exception exception, OrderBy orderBy)?
        error,
  }) {
    return error?.call(menus, exception, orderBy);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<MenuModel> menus, OrderBy orderBy)? loading,
    TResult Function(List<MenuModel> menus, OrderBy orderBy)? loaded,
    TResult Function(
            List<MenuModel> menus, Exception exception, OrderBy orderBy)?
        error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(menus, exception, orderBy);
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

abstract class _Error implements MenusState {
  const factory _Error(
      {required final List<MenuModel> menus,
      required final Exception exception,
      required final OrderBy orderBy}) = _$_Error;

  @override
  List<MenuModel> get menus;
  Exception get exception;
  @override
  OrderBy get orderBy;
  @override
  @JsonKey(ignore: true)
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
      throw _privateConstructorUsedError;
}
