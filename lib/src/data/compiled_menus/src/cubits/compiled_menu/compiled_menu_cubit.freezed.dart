// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'compiled_menu_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CompiledMenuState {
  Tuple2<MenuModel, List<Tuple2<CategoryModel, List<MenuItemModel>>>>
      get response => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Tuple2<MenuModel, List<Tuple2<CategoryModel, List<MenuItemModel>>>>
                response)
        loading,
    required TResult Function(
            Tuple2<MenuModel, List<Tuple2<CategoryModel, List<MenuItemModel>>>>
                response)
        loaded,
    required TResult Function(
            Tuple2<MenuModel, List<Tuple2<CategoryModel, List<MenuItemModel>>>>
                response,
            Exception exception)
        error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            Tuple2<MenuModel, List<Tuple2<CategoryModel, List<MenuItemModel>>>>
                response)?
        loading,
    TResult Function(
            Tuple2<MenuModel, List<Tuple2<CategoryModel, List<MenuItemModel>>>>
                response)?
        loaded,
    TResult Function(
            Tuple2<MenuModel, List<Tuple2<CategoryModel, List<MenuItemModel>>>>
                response,
            Exception exception)?
        error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            Tuple2<MenuModel, List<Tuple2<CategoryModel, List<MenuItemModel>>>>
                response)?
        loading,
    TResult Function(
            Tuple2<MenuModel, List<Tuple2<CategoryModel, List<MenuItemModel>>>>
                response)?
        loaded,
    TResult Function(
            Tuple2<MenuModel, List<Tuple2<CategoryModel, List<MenuItemModel>>>>
                response,
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
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
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
  $CompiledMenuStateCopyWith<CompiledMenuState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompiledMenuStateCopyWith<$Res> {
  factory $CompiledMenuStateCopyWith(
          CompiledMenuState value, $Res Function(CompiledMenuState) then) =
      _$CompiledMenuStateCopyWithImpl<$Res>;
  $Res call(
      {Tuple2<MenuModel, List<Tuple2<CategoryModel, List<MenuItemModel>>>>
          response});
}

/// @nodoc
class _$CompiledMenuStateCopyWithImpl<$Res>
    implements $CompiledMenuStateCopyWith<$Res> {
  _$CompiledMenuStateCopyWithImpl(this._value, this._then);

  final CompiledMenuState _value;
  // ignore: unused_field
  final $Res Function(CompiledMenuState) _then;

  @override
  $Res call({
    Object? response = freezed,
  }) {
    return _then(_value.copyWith(
      response: response == freezed
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as Tuple2<MenuModel,
                  List<Tuple2<CategoryModel, List<MenuItemModel>>>>,
    ));
  }
}

/// @nodoc
abstract class _$LoadingCopyWith<$Res>
    implements $CompiledMenuStateCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) then) =
      __$LoadingCopyWithImpl<$Res>;
  @override
  $Res call(
      {Tuple2<MenuModel, List<Tuple2<CategoryModel, List<MenuItemModel>>>>
          response});
}

/// @nodoc
class __$LoadingCopyWithImpl<$Res> extends _$CompiledMenuStateCopyWithImpl<$Res>
    implements _$LoadingCopyWith<$Res> {
  __$LoadingCopyWithImpl(_Loading _value, $Res Function(_Loading) _then)
      : super(_value, (v) => _then(v as _Loading));

  @override
  _Loading get _value => super._value as _Loading;

  @override
  $Res call({
    Object? response = freezed,
  }) {
    return _then(_Loading(
      response: response == freezed
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as Tuple2<MenuModel,
                  List<Tuple2<CategoryModel, List<MenuItemModel>>>>,
    ));
  }
}

/// @nodoc

class _$_Loading implements _Loading {
  const _$_Loading({required this.response});

  @override
  final Tuple2<MenuModel, List<Tuple2<CategoryModel, List<MenuItemModel>>>>
      response;

  @override
  String toString() {
    return 'CompiledMenuState.loading(response: $response)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Loading &&
            const DeepCollectionEquality().equals(other.response, response));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(response));

  @JsonKey(ignore: true)
  @override
  _$LoadingCopyWith<_Loading> get copyWith =>
      __$LoadingCopyWithImpl<_Loading>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Tuple2<MenuModel, List<Tuple2<CategoryModel, List<MenuItemModel>>>>
                response)
        loading,
    required TResult Function(
            Tuple2<MenuModel, List<Tuple2<CategoryModel, List<MenuItemModel>>>>
                response)
        loaded,
    required TResult Function(
            Tuple2<MenuModel, List<Tuple2<CategoryModel, List<MenuItemModel>>>>
                response,
            Exception exception)
        error,
  }) {
    return loading(response);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            Tuple2<MenuModel, List<Tuple2<CategoryModel, List<MenuItemModel>>>>
                response)?
        loading,
    TResult Function(
            Tuple2<MenuModel, List<Tuple2<CategoryModel, List<MenuItemModel>>>>
                response)?
        loaded,
    TResult Function(
            Tuple2<MenuModel, List<Tuple2<CategoryModel, List<MenuItemModel>>>>
                response,
            Exception exception)?
        error,
  }) {
    return loading?.call(response);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            Tuple2<MenuModel, List<Tuple2<CategoryModel, List<MenuItemModel>>>>
                response)?
        loading,
    TResult Function(
            Tuple2<MenuModel, List<Tuple2<CategoryModel, List<MenuItemModel>>>>
                response)?
        loaded,
    TResult Function(
            Tuple2<MenuModel, List<Tuple2<CategoryModel, List<MenuItemModel>>>>
                response,
            Exception exception)?
        error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(response);
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
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
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

abstract class _Loading implements CompiledMenuState {
  const factory _Loading(
      {required final Tuple2<MenuModel,
              List<Tuple2<CategoryModel, List<MenuItemModel>>>>
          response}) = _$_Loading;

  @override
  Tuple2<MenuModel, List<Tuple2<CategoryModel, List<MenuItemModel>>>>
      get response => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$LoadingCopyWith<_Loading> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$LoadedCopyWith<$Res>
    implements $CompiledMenuStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) then) =
      __$LoadedCopyWithImpl<$Res>;
  @override
  $Res call(
      {Tuple2<MenuModel, List<Tuple2<CategoryModel, List<MenuItemModel>>>>
          response});
}

/// @nodoc
class __$LoadedCopyWithImpl<$Res> extends _$CompiledMenuStateCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(_Loaded _value, $Res Function(_Loaded) _then)
      : super(_value, (v) => _then(v as _Loaded));

  @override
  _Loaded get _value => super._value as _Loaded;

  @override
  $Res call({
    Object? response = freezed,
  }) {
    return _then(_Loaded(
      response: response == freezed
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as Tuple2<MenuModel,
                  List<Tuple2<CategoryModel, List<MenuItemModel>>>>,
    ));
  }
}

/// @nodoc

class _$_Loaded implements _Loaded {
  const _$_Loaded({required this.response});

  @override
  final Tuple2<MenuModel, List<Tuple2<CategoryModel, List<MenuItemModel>>>>
      response;

  @override
  String toString() {
    return 'CompiledMenuState.loaded(response: $response)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Loaded &&
            const DeepCollectionEquality().equals(other.response, response));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(response));

  @JsonKey(ignore: true)
  @override
  _$LoadedCopyWith<_Loaded> get copyWith =>
      __$LoadedCopyWithImpl<_Loaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Tuple2<MenuModel, List<Tuple2<CategoryModel, List<MenuItemModel>>>>
                response)
        loading,
    required TResult Function(
            Tuple2<MenuModel, List<Tuple2<CategoryModel, List<MenuItemModel>>>>
                response)
        loaded,
    required TResult Function(
            Tuple2<MenuModel, List<Tuple2<CategoryModel, List<MenuItemModel>>>>
                response,
            Exception exception)
        error,
  }) {
    return loaded(response);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            Tuple2<MenuModel, List<Tuple2<CategoryModel, List<MenuItemModel>>>>
                response)?
        loading,
    TResult Function(
            Tuple2<MenuModel, List<Tuple2<CategoryModel, List<MenuItemModel>>>>
                response)?
        loaded,
    TResult Function(
            Tuple2<MenuModel, List<Tuple2<CategoryModel, List<MenuItemModel>>>>
                response,
            Exception exception)?
        error,
  }) {
    return loaded?.call(response);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            Tuple2<MenuModel, List<Tuple2<CategoryModel, List<MenuItemModel>>>>
                response)?
        loading,
    TResult Function(
            Tuple2<MenuModel, List<Tuple2<CategoryModel, List<MenuItemModel>>>>
                response)?
        loaded,
    TResult Function(
            Tuple2<MenuModel, List<Tuple2<CategoryModel, List<MenuItemModel>>>>
                response,
            Exception exception)?
        error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(response);
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
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
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

abstract class _Loaded implements CompiledMenuState {
  const factory _Loaded(
      {required final Tuple2<MenuModel,
              List<Tuple2<CategoryModel, List<MenuItemModel>>>>
          response}) = _$_Loaded;

  @override
  Tuple2<MenuModel, List<Tuple2<CategoryModel, List<MenuItemModel>>>>
      get response => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$LoadedCopyWith<_Loaded> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ErrorCopyWith<$Res>
    implements $CompiledMenuStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) then) =
      __$ErrorCopyWithImpl<$Res>;
  @override
  $Res call(
      {Tuple2<MenuModel, List<Tuple2<CategoryModel, List<MenuItemModel>>>>
          response,
      Exception exception});
}

/// @nodoc
class __$ErrorCopyWithImpl<$Res> extends _$CompiledMenuStateCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(_Error _value, $Res Function(_Error) _then)
      : super(_value, (v) => _then(v as _Error));

  @override
  _Error get _value => super._value as _Error;

  @override
  $Res call({
    Object? response = freezed,
    Object? exception = freezed,
  }) {
    return _then(_Error(
      response: response == freezed
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as Tuple2<MenuModel,
                  List<Tuple2<CategoryModel, List<MenuItemModel>>>>,
      exception: exception == freezed
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as Exception,
    ));
  }
}

/// @nodoc

class _$_Error implements _Error {
  const _$_Error({required this.response, required this.exception});

  @override
  final Tuple2<MenuModel, List<Tuple2<CategoryModel, List<MenuItemModel>>>>
      response;
  @override
  final Exception exception;

  @override
  String toString() {
    return 'CompiledMenuState.error(response: $response, exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Error &&
            const DeepCollectionEquality().equals(other.response, response) &&
            const DeepCollectionEquality().equals(other.exception, exception));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(response),
      const DeepCollectionEquality().hash(exception));

  @JsonKey(ignore: true)
  @override
  _$ErrorCopyWith<_Error> get copyWith =>
      __$ErrorCopyWithImpl<_Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Tuple2<MenuModel, List<Tuple2<CategoryModel, List<MenuItemModel>>>>
                response)
        loading,
    required TResult Function(
            Tuple2<MenuModel, List<Tuple2<CategoryModel, List<MenuItemModel>>>>
                response)
        loaded,
    required TResult Function(
            Tuple2<MenuModel, List<Tuple2<CategoryModel, List<MenuItemModel>>>>
                response,
            Exception exception)
        error,
  }) {
    return error(response, exception);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            Tuple2<MenuModel, List<Tuple2<CategoryModel, List<MenuItemModel>>>>
                response)?
        loading,
    TResult Function(
            Tuple2<MenuModel, List<Tuple2<CategoryModel, List<MenuItemModel>>>>
                response)?
        loaded,
    TResult Function(
            Tuple2<MenuModel, List<Tuple2<CategoryModel, List<MenuItemModel>>>>
                response,
            Exception exception)?
        error,
  }) {
    return error?.call(response, exception);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            Tuple2<MenuModel, List<Tuple2<CategoryModel, List<MenuItemModel>>>>
                response)?
        loading,
    TResult Function(
            Tuple2<MenuModel, List<Tuple2<CategoryModel, List<MenuItemModel>>>>
                response)?
        loaded,
    TResult Function(
            Tuple2<MenuModel, List<Tuple2<CategoryModel, List<MenuItemModel>>>>
                response,
            Exception exception)?
        error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(response, exception);
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
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
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

abstract class _Error implements CompiledMenuState {
  const factory _Error(
      {required final Tuple2<MenuModel,
              List<Tuple2<CategoryModel, List<MenuItemModel>>>>
          response,
      required final Exception exception}) = _$_Error;

  @override
  Tuple2<MenuModel, List<Tuple2<CategoryModel, List<MenuItemModel>>>>
      get response => throw _privateConstructorUsedError;
  Exception get exception => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ErrorCopyWith<_Error> get copyWith => throw _privateConstructorUsedError;
}
