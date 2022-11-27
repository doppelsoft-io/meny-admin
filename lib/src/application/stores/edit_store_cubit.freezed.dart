// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'edit_store_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EditStoreState {
  StoreModel get store => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(StoreModel store) initial,
    required TResult Function(StoreModel store) saving,
    required TResult Function(StoreModel store) success,
    required TResult Function(StoreModel store, Exception exception) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(StoreModel store)? initial,
    TResult? Function(StoreModel store)? saving,
    TResult? Function(StoreModel store)? success,
    TResult? Function(StoreModel store, Exception exception)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(StoreModel store)? initial,
    TResult Function(StoreModel store)? saving,
    TResult Function(StoreModel store)? success,
    TResult Function(StoreModel store, Exception exception)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Saving value) saving,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Saving value)? saving,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Saving value)? saving,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EditStoreStateCopyWith<EditStoreState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditStoreStateCopyWith<$Res> {
  factory $EditStoreStateCopyWith(
          EditStoreState value, $Res Function(EditStoreState) then) =
      _$EditStoreStateCopyWithImpl<$Res, EditStoreState>;
  @useResult
  $Res call({StoreModel store});

  $StoreModelCopyWith<$Res> get store;
}

/// @nodoc
class _$EditStoreStateCopyWithImpl<$Res, $Val extends EditStoreState>
    implements $EditStoreStateCopyWith<$Res> {
  _$EditStoreStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? store = null,
  }) {
    return _then(_value.copyWith(
      store: null == store
          ? _value.store
          : store // ignore: cast_nullable_to_non_nullable
              as StoreModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $StoreModelCopyWith<$Res> get store {
    return $StoreModelCopyWith<$Res>(_value.store, (value) {
      return _then(_value.copyWith(store: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res>
    implements $EditStoreStateCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({StoreModel store});

  @override
  $StoreModelCopyWith<$Res> get store;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$EditStoreStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? store = null,
  }) {
    return _then(_$_Initial(
      store: null == store
          ? _value.store
          : store // ignore: cast_nullable_to_non_nullable
              as StoreModel,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial({required this.store});

  @override
  final StoreModel store;

  @override
  String toString() {
    return 'EditStoreState.initial(store: $store)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initial &&
            (identical(other.store, store) || other.store == store));
  }

  @override
  int get hashCode => Object.hash(runtimeType, store);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      __$$_InitialCopyWithImpl<_$_Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(StoreModel store) initial,
    required TResult Function(StoreModel store) saving,
    required TResult Function(StoreModel store) success,
    required TResult Function(StoreModel store, Exception exception) error,
  }) {
    return initial(store);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(StoreModel store)? initial,
    TResult? Function(StoreModel store)? saving,
    TResult? Function(StoreModel store)? success,
    TResult? Function(StoreModel store, Exception exception)? error,
  }) {
    return initial?.call(store);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(StoreModel store)? initial,
    TResult Function(StoreModel store)? saving,
    TResult Function(StoreModel store)? success,
    TResult Function(StoreModel store, Exception exception)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(store);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Saving value) saving,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Saving value)? saving,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Saving value)? saving,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements EditStoreState {
  const factory _Initial({required final StoreModel store}) = _$_Initial;

  @override
  StoreModel get store;
  @override
  @JsonKey(ignore: true)
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SavingCopyWith<$Res>
    implements $EditStoreStateCopyWith<$Res> {
  factory _$$_SavingCopyWith(_$_Saving value, $Res Function(_$_Saving) then) =
      __$$_SavingCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({StoreModel store});

  @override
  $StoreModelCopyWith<$Res> get store;
}

/// @nodoc
class __$$_SavingCopyWithImpl<$Res>
    extends _$EditStoreStateCopyWithImpl<$Res, _$_Saving>
    implements _$$_SavingCopyWith<$Res> {
  __$$_SavingCopyWithImpl(_$_Saving _value, $Res Function(_$_Saving) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? store = null,
  }) {
    return _then(_$_Saving(
      store: null == store
          ? _value.store
          : store // ignore: cast_nullable_to_non_nullable
              as StoreModel,
    ));
  }
}

/// @nodoc

class _$_Saving implements _Saving {
  const _$_Saving({required this.store});

  @override
  final StoreModel store;

  @override
  String toString() {
    return 'EditStoreState.saving(store: $store)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Saving &&
            (identical(other.store, store) || other.store == store));
  }

  @override
  int get hashCode => Object.hash(runtimeType, store);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SavingCopyWith<_$_Saving> get copyWith =>
      __$$_SavingCopyWithImpl<_$_Saving>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(StoreModel store) initial,
    required TResult Function(StoreModel store) saving,
    required TResult Function(StoreModel store) success,
    required TResult Function(StoreModel store, Exception exception) error,
  }) {
    return saving(store);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(StoreModel store)? initial,
    TResult? Function(StoreModel store)? saving,
    TResult? Function(StoreModel store)? success,
    TResult? Function(StoreModel store, Exception exception)? error,
  }) {
    return saving?.call(store);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(StoreModel store)? initial,
    TResult Function(StoreModel store)? saving,
    TResult Function(StoreModel store)? success,
    TResult Function(StoreModel store, Exception exception)? error,
    required TResult orElse(),
  }) {
    if (saving != null) {
      return saving(store);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Saving value) saving,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return saving(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Saving value)? saving,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) {
    return saving?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Saving value)? saving,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (saving != null) {
      return saving(this);
    }
    return orElse();
  }
}

abstract class _Saving implements EditStoreState {
  const factory _Saving({required final StoreModel store}) = _$_Saving;

  @override
  StoreModel get store;
  @override
  @JsonKey(ignore: true)
  _$$_SavingCopyWith<_$_Saving> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SuccessCopyWith<$Res>
    implements $EditStoreStateCopyWith<$Res> {
  factory _$$_SuccessCopyWith(
          _$_Success value, $Res Function(_$_Success) then) =
      __$$_SuccessCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({StoreModel store});

  @override
  $StoreModelCopyWith<$Res> get store;
}

/// @nodoc
class __$$_SuccessCopyWithImpl<$Res>
    extends _$EditStoreStateCopyWithImpl<$Res, _$_Success>
    implements _$$_SuccessCopyWith<$Res> {
  __$$_SuccessCopyWithImpl(_$_Success _value, $Res Function(_$_Success) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? store = null,
  }) {
    return _then(_$_Success(
      store: null == store
          ? _value.store
          : store // ignore: cast_nullable_to_non_nullable
              as StoreModel,
    ));
  }
}

/// @nodoc

class _$_Success implements _Success {
  const _$_Success({required this.store});

  @override
  final StoreModel store;

  @override
  String toString() {
    return 'EditStoreState.success(store: $store)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Success &&
            (identical(other.store, store) || other.store == store));
  }

  @override
  int get hashCode => Object.hash(runtimeType, store);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SuccessCopyWith<_$_Success> get copyWith =>
      __$$_SuccessCopyWithImpl<_$_Success>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(StoreModel store) initial,
    required TResult Function(StoreModel store) saving,
    required TResult Function(StoreModel store) success,
    required TResult Function(StoreModel store, Exception exception) error,
  }) {
    return success(store);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(StoreModel store)? initial,
    TResult? Function(StoreModel store)? saving,
    TResult? Function(StoreModel store)? success,
    TResult? Function(StoreModel store, Exception exception)? error,
  }) {
    return success?.call(store);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(StoreModel store)? initial,
    TResult Function(StoreModel store)? saving,
    TResult Function(StoreModel store)? success,
    TResult Function(StoreModel store, Exception exception)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(store);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Saving value) saving,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Saving value)? saving,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Saving value)? saving,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements EditStoreState {
  const factory _Success({required final StoreModel store}) = _$_Success;

  @override
  StoreModel get store;
  @override
  @JsonKey(ignore: true)
  _$$_SuccessCopyWith<_$_Success> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ErrorCopyWith<$Res>
    implements $EditStoreStateCopyWith<$Res> {
  factory _$$_ErrorCopyWith(_$_Error value, $Res Function(_$_Error) then) =
      __$$_ErrorCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({StoreModel store, Exception exception});

  @override
  $StoreModelCopyWith<$Res> get store;
}

/// @nodoc
class __$$_ErrorCopyWithImpl<$Res>
    extends _$EditStoreStateCopyWithImpl<$Res, _$_Error>
    implements _$$_ErrorCopyWith<$Res> {
  __$$_ErrorCopyWithImpl(_$_Error _value, $Res Function(_$_Error) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? store = null,
    Object? exception = null,
  }) {
    return _then(_$_Error(
      store: null == store
          ? _value.store
          : store // ignore: cast_nullable_to_non_nullable
              as StoreModel,
      exception: null == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as Exception,
    ));
  }
}

/// @nodoc

class _$_Error implements _Error {
  const _$_Error({required this.store, required this.exception});

  @override
  final StoreModel store;
  @override
  final Exception exception;

  @override
  String toString() {
    return 'EditStoreState.error(store: $store, exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Error &&
            (identical(other.store, store) || other.store == store) &&
            (identical(other.exception, exception) ||
                other.exception == exception));
  }

  @override
  int get hashCode => Object.hash(runtimeType, store, exception);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
      __$$_ErrorCopyWithImpl<_$_Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(StoreModel store) initial,
    required TResult Function(StoreModel store) saving,
    required TResult Function(StoreModel store) success,
    required TResult Function(StoreModel store, Exception exception) error,
  }) {
    return error(store, exception);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(StoreModel store)? initial,
    TResult? Function(StoreModel store)? saving,
    TResult? Function(StoreModel store)? success,
    TResult? Function(StoreModel store, Exception exception)? error,
  }) {
    return error?.call(store, exception);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(StoreModel store)? initial,
    TResult Function(StoreModel store)? saving,
    TResult Function(StoreModel store)? success,
    TResult Function(StoreModel store, Exception exception)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(store, exception);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Saving value) saving,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Saving value)? saving,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Saving value)? saving,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements EditStoreState {
  const factory _Error(
      {required final StoreModel store,
      required final Exception exception}) = _$_Error;

  @override
  StoreModel get store;
  Exception get exception;
  @override
  @JsonKey(ignore: true)
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
      throw _privateConstructorUsedError;
}
