// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
    TResult? Function(MenuItemModel item)? loading,
    TResult? Function(MenuItemModel item)? loaded,
    TResult? Function(MenuItemModel item)? updating,
    TResult? Function(MenuItemModel item)? success,
    TResult? Function(MenuItemModel item, Exception exception)? error,
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
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Updating value)? updating,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
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
      _$EditMenuItemStateCopyWithImpl<$Res, EditMenuItemState>;
  @useResult
  $Res call({MenuItemModel item});

  $MenuItemModelCopyWith<$Res> get item;
}

/// @nodoc
class _$EditMenuItemStateCopyWithImpl<$Res, $Val extends EditMenuItemState>
    implements $EditMenuItemStateCopyWith<$Res> {
  _$EditMenuItemStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
  }) {
    return _then(_value.copyWith(
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as MenuItemModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MenuItemModelCopyWith<$Res> get item {
    return $MenuItemModelCopyWith<$Res>(_value.item, (value) {
      return _then(_value.copyWith(item: value) as $Val);
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
  @useResult
  $Res call({MenuItemModel item});

  @override
  $MenuItemModelCopyWith<$Res> get item;
}

/// @nodoc
class __$$_LoadingCopyWithImpl<$Res>
    extends _$EditMenuItemStateCopyWithImpl<$Res, _$_Loading>
    implements _$$_LoadingCopyWith<$Res> {
  __$$_LoadingCopyWithImpl(_$_Loading _value, $Res Function(_$_Loading) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
  }) {
    return _then(_$_Loading(
      item: null == item
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
            (identical(other.item, item) || other.item == item));
  }

  @override
  int get hashCode => Object.hash(runtimeType, item);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
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
    TResult? Function(MenuItemModel item)? loading,
    TResult? Function(MenuItemModel item)? loaded,
    TResult? Function(MenuItemModel item)? updating,
    TResult? Function(MenuItemModel item)? success,
    TResult? Function(MenuItemModel item, Exception exception)? error,
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
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Updating value)? updating,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
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
  MenuItemModel get item;
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
  @useResult
  $Res call({MenuItemModel item});

  @override
  $MenuItemModelCopyWith<$Res> get item;
}

/// @nodoc
class __$$_LoadedCopyWithImpl<$Res>
    extends _$EditMenuItemStateCopyWithImpl<$Res, _$_Loaded>
    implements _$$_LoadedCopyWith<$Res> {
  __$$_LoadedCopyWithImpl(_$_Loaded _value, $Res Function(_$_Loaded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
  }) {
    return _then(_$_Loaded(
      item: null == item
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
            (identical(other.item, item) || other.item == item));
  }

  @override
  int get hashCode => Object.hash(runtimeType, item);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
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
    TResult? Function(MenuItemModel item)? loading,
    TResult? Function(MenuItemModel item)? loaded,
    TResult? Function(MenuItemModel item)? updating,
    TResult? Function(MenuItemModel item)? success,
    TResult? Function(MenuItemModel item, Exception exception)? error,
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
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Updating value)? updating,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
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
  MenuItemModel get item;
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
  @useResult
  $Res call({MenuItemModel item});

  @override
  $MenuItemModelCopyWith<$Res> get item;
}

/// @nodoc
class __$$_UpdatingCopyWithImpl<$Res>
    extends _$EditMenuItemStateCopyWithImpl<$Res, _$_Updating>
    implements _$$_UpdatingCopyWith<$Res> {
  __$$_UpdatingCopyWithImpl(
      _$_Updating _value, $Res Function(_$_Updating) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
  }) {
    return _then(_$_Updating(
      item: null == item
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
            (identical(other.item, item) || other.item == item));
  }

  @override
  int get hashCode => Object.hash(runtimeType, item);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
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
    TResult? Function(MenuItemModel item)? loading,
    TResult? Function(MenuItemModel item)? loaded,
    TResult? Function(MenuItemModel item)? updating,
    TResult? Function(MenuItemModel item)? success,
    TResult? Function(MenuItemModel item, Exception exception)? error,
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
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Updating value)? updating,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
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
  MenuItemModel get item;
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
  @useResult
  $Res call({MenuItemModel item});

  @override
  $MenuItemModelCopyWith<$Res> get item;
}

/// @nodoc
class __$$_SuccessCopyWithImpl<$Res>
    extends _$EditMenuItemStateCopyWithImpl<$Res, _$_Success>
    implements _$$_SuccessCopyWith<$Res> {
  __$$_SuccessCopyWithImpl(_$_Success _value, $Res Function(_$_Success) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
  }) {
    return _then(_$_Success(
      item: null == item
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
            (identical(other.item, item) || other.item == item));
  }

  @override
  int get hashCode => Object.hash(runtimeType, item);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
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
    TResult? Function(MenuItemModel item)? loading,
    TResult? Function(MenuItemModel item)? loaded,
    TResult? Function(MenuItemModel item)? updating,
    TResult? Function(MenuItemModel item)? success,
    TResult? Function(MenuItemModel item, Exception exception)? error,
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
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Updating value)? updating,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
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
  MenuItemModel get item;
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
  @useResult
  $Res call({MenuItemModel item, Exception exception});

  @override
  $MenuItemModelCopyWith<$Res> get item;
}

/// @nodoc
class __$$_ErrorCopyWithImpl<$Res>
    extends _$EditMenuItemStateCopyWithImpl<$Res, _$_Error>
    implements _$$_ErrorCopyWith<$Res> {
  __$$_ErrorCopyWithImpl(_$_Error _value, $Res Function(_$_Error) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
    Object? exception = null,
  }) {
    return _then(_$_Error(
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as MenuItemModel,
      exception: null == exception
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
            (identical(other.item, item) || other.item == item) &&
            (identical(other.exception, exception) ||
                other.exception == exception));
  }

  @override
  int get hashCode => Object.hash(runtimeType, item, exception);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
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
    TResult? Function(MenuItemModel item)? loading,
    TResult? Function(MenuItemModel item)? loaded,
    TResult? Function(MenuItemModel item)? updating,
    TResult? Function(MenuItemModel item)? success,
    TResult? Function(MenuItemModel item, Exception exception)? error,
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
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Updating value)? updating,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
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
  MenuItemModel get item;
  Exception get exception;
  @override
  @JsonKey(ignore: true)
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
      throw _privateConstructorUsedError;
}
