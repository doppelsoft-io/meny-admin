// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'edit_menu_item_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EditMenuItemState {
  MenuItemModel get item => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(MenuItemModel item) loading,
    required TResult Function(MenuItemModel item) loaded,
    required TResult Function(MenuItemModel item) updating,
    required TResult Function(MenuItemModel item) success,
    required TResult Function(MenuItemModel item, Exception exception) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(MenuItemModel item)? loading,
    TResult Function(MenuItemModel item)? loaded,
    TResult Function(MenuItemModel item)? updating,
    TResult Function(MenuItemModel item)? success,
    TResult Function(MenuItemModel item, Exception exception)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(MenuItemModel item)? loading,
    TResult Function(MenuItemModel item)? loaded,
    TResult Function(MenuItemModel item)? updating,
    TResult Function(MenuItemModel item)? success,
    TResult Function(MenuItemModel item, Exception exception)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Updating value) updating,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Updating value)? updating,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Updating value)? updating,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EditMenuItemStateCopyWith<EditMenuItemState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditMenuItemStateCopyWith<$Res> {
  factory $EditMenuItemStateCopyWith(
          EditMenuItemState value, $Res Function(EditMenuItemState) then) =
      _$EditMenuItemStateCopyWithImpl<$Res>;
  $Res call({MenuItemModel item});

  $MenuItemModelCopyWith<$Res> get item;
}

/// @nodoc
class _$EditMenuItemStateCopyWithImpl<$Res>
    implements $EditMenuItemStateCopyWith<$Res> {
  _$EditMenuItemStateCopyWithImpl(this._value, this._then);

  final EditMenuItemState _value;
  // ignore: unused_field
  final $Res Function(EditMenuItemState) _then;

  @override
  $Res call({
    Object? item = freezed,
  }) {
    return _then(_value.copyWith(
      item: item == freezed
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as MenuItemModel,
    ));
  }

  @override
  $MenuItemModelCopyWith<$Res> get item {
    return $MenuItemModelCopyWith<$Res>(_value.item, (value) {
      return _then(_value.copyWith(item: value));
    });
  }
}

/// @nodoc
abstract class _$$_LoadingCopyWith<$Res>
    implements $EditMenuItemStateCopyWith<$Res> {
  factory _$$_LoadingCopyWith(
          _$_Loading value, $Res Function(_$_Loading) then) =
      __$$_LoadingCopyWithImpl<$Res>;
  @override
  $Res call({MenuItemModel item});

  @override
  $MenuItemModelCopyWith<$Res> get item;
}

/// @nodoc
class __$$_LoadingCopyWithImpl<$Res>
    extends _$EditMenuItemStateCopyWithImpl<$Res>
    implements _$$_LoadingCopyWith<$Res> {
  __$$_LoadingCopyWithImpl(_$_Loading _value, $Res Function(_$_Loading) _then)
      : super(_value, (v) => _then(v as _$_Loading));

  @override
  _$_Loading get _value => super._value as _$_Loading;

  @override
  $Res call({
    Object? item = freezed,
  }) {
    return _then(_$_Loading(
      item: item == freezed
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as MenuItemModel,
    ));
  }
}

/// @nodoc

class _$_Loading implements _Loading {
  const _$_Loading({required this.item});

  @override
  final MenuItemModel item;

  @override
  String toString() {
    return 'EditMenuItemState.loading(item: $item)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Loading &&
            const DeepCollectionEquality().equals(other.item, item));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(item));

  @JsonKey(ignore: true)
  @override
  _$$_LoadingCopyWith<_$_Loading> get copyWith =>
      __$$_LoadingCopyWithImpl<_$_Loading>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(MenuItemModel item) loading,
    required TResult Function(MenuItemModel item) loaded,
    required TResult Function(MenuItemModel item) updating,
    required TResult Function(MenuItemModel item) success,
    required TResult Function(MenuItemModel item, Exception exception) error,
  }) {
    return loading(item);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(MenuItemModel item)? loading,
    TResult Function(MenuItemModel item)? loaded,
    TResult Function(MenuItemModel item)? updating,
    TResult Function(MenuItemModel item)? success,
    TResult Function(MenuItemModel item, Exception exception)? error,
  }) {
    return loading?.call(item);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(MenuItemModel item)? loading,
    TResult Function(MenuItemModel item)? loaded,
    TResult Function(MenuItemModel item)? updating,
    TResult Function(MenuItemModel item)? success,
    TResult Function(MenuItemModel item, Exception exception)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(item);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Updating value) updating,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Updating value)? updating,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Updating value)? updating,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements EditMenuItemState {
  const factory _Loading({required final MenuItemModel item}) = _$_Loading;

  @override
  MenuItemModel get item => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_LoadingCopyWith<_$_Loading> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LoadedCopyWith<$Res>
    implements $EditMenuItemStateCopyWith<$Res> {
  factory _$$_LoadedCopyWith(_$_Loaded value, $Res Function(_$_Loaded) then) =
      __$$_LoadedCopyWithImpl<$Res>;
  @override
  $Res call({MenuItemModel item});

  @override
  $MenuItemModelCopyWith<$Res> get item;
}

/// @nodoc
class __$$_LoadedCopyWithImpl<$Res>
    extends _$EditMenuItemStateCopyWithImpl<$Res>
    implements _$$_LoadedCopyWith<$Res> {
  __$$_LoadedCopyWithImpl(_$_Loaded _value, $Res Function(_$_Loaded) _then)
      : super(_value, (v) => _then(v as _$_Loaded));

  @override
  _$_Loaded get _value => super._value as _$_Loaded;

  @override
  $Res call({
    Object? item = freezed,
  }) {
    return _then(_$_Loaded(
      item: item == freezed
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as MenuItemModel,
    ));
  }
}

/// @nodoc

class _$_Loaded implements _Loaded {
  const _$_Loaded({required this.item});

  @override
  final MenuItemModel item;

  @override
  String toString() {
    return 'EditMenuItemState.loaded(item: $item)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Loaded &&
            const DeepCollectionEquality().equals(other.item, item));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(item));

  @JsonKey(ignore: true)
  @override
  _$$_LoadedCopyWith<_$_Loaded> get copyWith =>
      __$$_LoadedCopyWithImpl<_$_Loaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(MenuItemModel item) loading,
    required TResult Function(MenuItemModel item) loaded,
    required TResult Function(MenuItemModel item) updating,
    required TResult Function(MenuItemModel item) success,
    required TResult Function(MenuItemModel item, Exception exception) error,
  }) {
    return loaded(item);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(MenuItemModel item)? loading,
    TResult Function(MenuItemModel item)? loaded,
    TResult Function(MenuItemModel item)? updating,
    TResult Function(MenuItemModel item)? success,
    TResult Function(MenuItemModel item, Exception exception)? error,
  }) {
    return loaded?.call(item);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(MenuItemModel item)? loading,
    TResult Function(MenuItemModel item)? loaded,
    TResult Function(MenuItemModel item)? updating,
    TResult Function(MenuItemModel item)? success,
    TResult Function(MenuItemModel item, Exception exception)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(item);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Updating value) updating,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Updating value)? updating,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Updating value)? updating,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements EditMenuItemState {
  const factory _Loaded({required final MenuItemModel item}) = _$_Loaded;

  @override
  MenuItemModel get item => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_LoadedCopyWith<_$_Loaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UpdatingCopyWith<$Res>
    implements $EditMenuItemStateCopyWith<$Res> {
  factory _$$_UpdatingCopyWith(
          _$_Updating value, $Res Function(_$_Updating) then) =
      __$$_UpdatingCopyWithImpl<$Res>;
  @override
  $Res call({MenuItemModel item});

  @override
  $MenuItemModelCopyWith<$Res> get item;
}

/// @nodoc
class __$$_UpdatingCopyWithImpl<$Res>
    extends _$EditMenuItemStateCopyWithImpl<$Res>
    implements _$$_UpdatingCopyWith<$Res> {
  __$$_UpdatingCopyWithImpl(
      _$_Updating _value, $Res Function(_$_Updating) _then)
      : super(_value, (v) => _then(v as _$_Updating));

  @override
  _$_Updating get _value => super._value as _$_Updating;

  @override
  $Res call({
    Object? item = freezed,
  }) {
    return _then(_$_Updating(
      item: item == freezed
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as MenuItemModel,
    ));
  }
}

/// @nodoc

class _$_Updating implements _Updating {
  const _$_Updating({required this.item});

  @override
  final MenuItemModel item;

  @override
  String toString() {
    return 'EditMenuItemState.updating(item: $item)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Updating &&
            const DeepCollectionEquality().equals(other.item, item));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(item));

  @JsonKey(ignore: true)
  @override
  _$$_UpdatingCopyWith<_$_Updating> get copyWith =>
      __$$_UpdatingCopyWithImpl<_$_Updating>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(MenuItemModel item) loading,
    required TResult Function(MenuItemModel item) loaded,
    required TResult Function(MenuItemModel item) updating,
    required TResult Function(MenuItemModel item) success,
    required TResult Function(MenuItemModel item, Exception exception) error,
  }) {
    return updating(item);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(MenuItemModel item)? loading,
    TResult Function(MenuItemModel item)? loaded,
    TResult Function(MenuItemModel item)? updating,
    TResult Function(MenuItemModel item)? success,
    TResult Function(MenuItemModel item, Exception exception)? error,
  }) {
    return updating?.call(item);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(MenuItemModel item)? loading,
    TResult Function(MenuItemModel item)? loaded,
    TResult Function(MenuItemModel item)? updating,
    TResult Function(MenuItemModel item)? success,
    TResult Function(MenuItemModel item, Exception exception)? error,
    required TResult orElse(),
  }) {
    if (updating != null) {
      return updating(item);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Updating value) updating,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return updating(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Updating value)? updating,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
  }) {
    return updating?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Updating value)? updating,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (updating != null) {
      return updating(this);
    }
    return orElse();
  }
}

abstract class _Updating implements EditMenuItemState {
  const factory _Updating({required final MenuItemModel item}) = _$_Updating;

  @override
  MenuItemModel get item => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_UpdatingCopyWith<_$_Updating> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SuccessCopyWith<$Res>
    implements $EditMenuItemStateCopyWith<$Res> {
  factory _$$_SuccessCopyWith(
          _$_Success value, $Res Function(_$_Success) then) =
      __$$_SuccessCopyWithImpl<$Res>;
  @override
  $Res call({MenuItemModel item});

  @override
  $MenuItemModelCopyWith<$Res> get item;
}

/// @nodoc
class __$$_SuccessCopyWithImpl<$Res>
    extends _$EditMenuItemStateCopyWithImpl<$Res>
    implements _$$_SuccessCopyWith<$Res> {
  __$$_SuccessCopyWithImpl(_$_Success _value, $Res Function(_$_Success) _then)
      : super(_value, (v) => _then(v as _$_Success));

  @override
  _$_Success get _value => super._value as _$_Success;

  @override
  $Res call({
    Object? item = freezed,
  }) {
    return _then(_$_Success(
      item: item == freezed
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as MenuItemModel,
    ));
  }
}

/// @nodoc

class _$_Success implements _Success {
  const _$_Success({required this.item});

  @override
  final MenuItemModel item;

  @override
  String toString() {
    return 'EditMenuItemState.success(item: $item)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Success &&
            const DeepCollectionEquality().equals(other.item, item));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(item));

  @JsonKey(ignore: true)
  @override
  _$$_SuccessCopyWith<_$_Success> get copyWith =>
      __$$_SuccessCopyWithImpl<_$_Success>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(MenuItemModel item) loading,
    required TResult Function(MenuItemModel item) loaded,
    required TResult Function(MenuItemModel item) updating,
    required TResult Function(MenuItemModel item) success,
    required TResult Function(MenuItemModel item, Exception exception) error,
  }) {
    return success(item);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(MenuItemModel item)? loading,
    TResult Function(MenuItemModel item)? loaded,
    TResult Function(MenuItemModel item)? updating,
    TResult Function(MenuItemModel item)? success,
    TResult Function(MenuItemModel item, Exception exception)? error,
  }) {
    return success?.call(item);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(MenuItemModel item)? loading,
    TResult Function(MenuItemModel item)? loaded,
    TResult Function(MenuItemModel item)? updating,
    TResult Function(MenuItemModel item)? success,
    TResult Function(MenuItemModel item, Exception exception)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(item);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Updating value) updating,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Updating value)? updating,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Updating value)? updating,
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

abstract class _Success implements EditMenuItemState {
  const factory _Success({required final MenuItemModel item}) = _$_Success;

  @override
  MenuItemModel get item => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_SuccessCopyWith<_$_Success> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ErrorCopyWith<$Res>
    implements $EditMenuItemStateCopyWith<$Res> {
  factory _$$_ErrorCopyWith(_$_Error value, $Res Function(_$_Error) then) =
      __$$_ErrorCopyWithImpl<$Res>;
  @override
  $Res call({MenuItemModel item, Exception exception});

  @override
  $MenuItemModelCopyWith<$Res> get item;
}

/// @nodoc
class __$$_ErrorCopyWithImpl<$Res> extends _$EditMenuItemStateCopyWithImpl<$Res>
    implements _$$_ErrorCopyWith<$Res> {
  __$$_ErrorCopyWithImpl(_$_Error _value, $Res Function(_$_Error) _then)
      : super(_value, (v) => _then(v as _$_Error));

  @override
  _$_Error get _value => super._value as _$_Error;

  @override
  $Res call({
    Object? item = freezed,
    Object? exception = freezed,
  }) {
    return _then(_$_Error(
      item: item == freezed
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as MenuItemModel,
      exception: exception == freezed
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as Exception,
    ));
  }
}

/// @nodoc

class _$_Error implements _Error {
  const _$_Error({required this.item, required this.exception});

  @override
  final MenuItemModel item;
  @override
  final Exception exception;

  @override
  String toString() {
    return 'EditMenuItemState.error(item: $item, exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Error &&
            const DeepCollectionEquality().equals(other.item, item) &&
            const DeepCollectionEquality().equals(other.exception, exception));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(item),
      const DeepCollectionEquality().hash(exception));

  @JsonKey(ignore: true)
  @override
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
      __$$_ErrorCopyWithImpl<_$_Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(MenuItemModel item) loading,
    required TResult Function(MenuItemModel item) loaded,
    required TResult Function(MenuItemModel item) updating,
    required TResult Function(MenuItemModel item) success,
    required TResult Function(MenuItemModel item, Exception exception) error,
  }) {
    return error(item, exception);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(MenuItemModel item)? loading,
    TResult Function(MenuItemModel item)? loaded,
    TResult Function(MenuItemModel item)? updating,
    TResult Function(MenuItemModel item)? success,
    TResult Function(MenuItemModel item, Exception exception)? error,
  }) {
    return error?.call(item, exception);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(MenuItemModel item)? loading,
    TResult Function(MenuItemModel item)? loaded,
    TResult Function(MenuItemModel item)? updating,
    TResult Function(MenuItemModel item)? success,
    TResult Function(MenuItemModel item, Exception exception)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(item, exception);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Updating value) updating,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Updating value)? updating,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Updating value)? updating,
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

abstract class _Error implements EditMenuItemState {
  const factory _Error(
      {required final MenuItemModel item,
      required final Exception exception}) = _$_Error;

  @override
  MenuItemModel get item => throw _privateConstructorUsedError;
  Exception get exception => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
      throw _privateConstructorUsedError;
}
