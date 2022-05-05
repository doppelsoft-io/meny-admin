// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'image_upload_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ImageUploadState {
  XFile get file => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(XFile file, String url) initial,
    required TResult Function(XFile file, String url) picked,
    required TResult Function(XFile file, String url) uploading,
    required TResult Function(XFile file, String url) uploaded,
    required TResult Function(XFile file, String url, Exception exception)
        error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(XFile file, String url)? initial,
    TResult Function(XFile file, String url)? picked,
    TResult Function(XFile file, String url)? uploading,
    TResult Function(XFile file, String url)? uploaded,
    TResult Function(XFile file, String url, Exception exception)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(XFile file, String url)? initial,
    TResult Function(XFile file, String url)? picked,
    TResult Function(XFile file, String url)? uploading,
    TResult Function(XFile file, String url)? uploaded,
    TResult Function(XFile file, String url, Exception exception)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Picked value) picked,
    required TResult Function(_Uploading value) uploading,
    required TResult Function(_Uploaded value) uploaded,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Picked value)? picked,
    TResult Function(_Uploading value)? uploading,
    TResult Function(_Uploaded value)? uploaded,
    TResult Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Picked value)? picked,
    TResult Function(_Uploading value)? uploading,
    TResult Function(_Uploaded value)? uploaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ImageUploadStateCopyWith<ImageUploadState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageUploadStateCopyWith<$Res> {
  factory $ImageUploadStateCopyWith(
          ImageUploadState value, $Res Function(ImageUploadState) then) =
      _$ImageUploadStateCopyWithImpl<$Res>;
  $Res call({XFile file, String url});
}

/// @nodoc
class _$ImageUploadStateCopyWithImpl<$Res>
    implements $ImageUploadStateCopyWith<$Res> {
  _$ImageUploadStateCopyWithImpl(this._value, this._then);

  final ImageUploadState _value;
  // ignore: unused_field
  final $Res Function(ImageUploadState) _then;

  @override
  $Res call({
    Object? file = freezed,
    Object? url = freezed,
  }) {
    return _then(_value.copyWith(
      file: file == freezed
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as XFile,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$InitialCopyWith<$Res>
    implements $ImageUploadStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
  @override
  $Res call({XFile file, String url});
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> extends _$ImageUploadStateCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(_Initial _value, $Res Function(_Initial) _then)
      : super(_value, (v) => _then(v as _Initial));

  @override
  _Initial get _value => super._value as _Initial;

  @override
  $Res call({
    Object? file = freezed,
    Object? url = freezed,
  }) {
    return _then(_Initial(
      file: file == freezed
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as XFile,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial({required this.file, this.url = ''});

  @override
  final XFile file;
  @override
  @JsonKey()
  final String url;

  @override
  String toString() {
    return 'ImageUploadState.initial(file: $file, url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Initial &&
            const DeepCollectionEquality().equals(other.file, file) &&
            const DeepCollectionEquality().equals(other.url, url));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(file),
      const DeepCollectionEquality().hash(url));

  @JsonKey(ignore: true)
  @override
  _$InitialCopyWith<_Initial> get copyWith =>
      __$InitialCopyWithImpl<_Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(XFile file, String url) initial,
    required TResult Function(XFile file, String url) picked,
    required TResult Function(XFile file, String url) uploading,
    required TResult Function(XFile file, String url) uploaded,
    required TResult Function(XFile file, String url, Exception exception)
        error,
  }) {
    return initial(file, url);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(XFile file, String url)? initial,
    TResult Function(XFile file, String url)? picked,
    TResult Function(XFile file, String url)? uploading,
    TResult Function(XFile file, String url)? uploaded,
    TResult Function(XFile file, String url, Exception exception)? error,
  }) {
    return initial?.call(file, url);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(XFile file, String url)? initial,
    TResult Function(XFile file, String url)? picked,
    TResult Function(XFile file, String url)? uploading,
    TResult Function(XFile file, String url)? uploaded,
    TResult Function(XFile file, String url, Exception exception)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(file, url);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Picked value) picked,
    required TResult Function(_Uploading value) uploading,
    required TResult Function(_Uploaded value) uploaded,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Picked value)? picked,
    TResult Function(_Uploading value)? uploading,
    TResult Function(_Uploaded value)? uploaded,
    TResult Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Picked value)? picked,
    TResult Function(_Uploading value)? uploading,
    TResult Function(_Uploaded value)? uploaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements ImageUploadState {
  const factory _Initial({required final XFile file, final String url}) =
      _$_Initial;

  @override
  XFile get file => throw _privateConstructorUsedError;
  @override
  String get url => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$InitialCopyWith<_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$PickedCopyWith<$Res>
    implements $ImageUploadStateCopyWith<$Res> {
  factory _$PickedCopyWith(_Picked value, $Res Function(_Picked) then) =
      __$PickedCopyWithImpl<$Res>;
  @override
  $Res call({XFile file, String url});
}

/// @nodoc
class __$PickedCopyWithImpl<$Res> extends _$ImageUploadStateCopyWithImpl<$Res>
    implements _$PickedCopyWith<$Res> {
  __$PickedCopyWithImpl(_Picked _value, $Res Function(_Picked) _then)
      : super(_value, (v) => _then(v as _Picked));

  @override
  _Picked get _value => super._value as _Picked;

  @override
  $Res call({
    Object? file = freezed,
    Object? url = freezed,
  }) {
    return _then(_Picked(
      file: file == freezed
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as XFile,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Picked implements _Picked {
  const _$_Picked({required this.file, required this.url});

  @override
  final XFile file;
  @override
  final String url;

  @override
  String toString() {
    return 'ImageUploadState.picked(file: $file, url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Picked &&
            const DeepCollectionEquality().equals(other.file, file) &&
            const DeepCollectionEquality().equals(other.url, url));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(file),
      const DeepCollectionEquality().hash(url));

  @JsonKey(ignore: true)
  @override
  _$PickedCopyWith<_Picked> get copyWith =>
      __$PickedCopyWithImpl<_Picked>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(XFile file, String url) initial,
    required TResult Function(XFile file, String url) picked,
    required TResult Function(XFile file, String url) uploading,
    required TResult Function(XFile file, String url) uploaded,
    required TResult Function(XFile file, String url, Exception exception)
        error,
  }) {
    return picked(file, url);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(XFile file, String url)? initial,
    TResult Function(XFile file, String url)? picked,
    TResult Function(XFile file, String url)? uploading,
    TResult Function(XFile file, String url)? uploaded,
    TResult Function(XFile file, String url, Exception exception)? error,
  }) {
    return picked?.call(file, url);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(XFile file, String url)? initial,
    TResult Function(XFile file, String url)? picked,
    TResult Function(XFile file, String url)? uploading,
    TResult Function(XFile file, String url)? uploaded,
    TResult Function(XFile file, String url, Exception exception)? error,
    required TResult orElse(),
  }) {
    if (picked != null) {
      return picked(file, url);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Picked value) picked,
    required TResult Function(_Uploading value) uploading,
    required TResult Function(_Uploaded value) uploaded,
    required TResult Function(_Error value) error,
  }) {
    return picked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Picked value)? picked,
    TResult Function(_Uploading value)? uploading,
    TResult Function(_Uploaded value)? uploaded,
    TResult Function(_Error value)? error,
  }) {
    return picked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Picked value)? picked,
    TResult Function(_Uploading value)? uploading,
    TResult Function(_Uploaded value)? uploaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (picked != null) {
      return picked(this);
    }
    return orElse();
  }
}

abstract class _Picked implements ImageUploadState {
  const factory _Picked(
      {required final XFile file, required final String url}) = _$_Picked;

  @override
  XFile get file => throw _privateConstructorUsedError;
  @override
  String get url => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PickedCopyWith<_Picked> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$UploadingCopyWith<$Res>
    implements $ImageUploadStateCopyWith<$Res> {
  factory _$UploadingCopyWith(
          _Uploading value, $Res Function(_Uploading) then) =
      __$UploadingCopyWithImpl<$Res>;
  @override
  $Res call({XFile file, String url});
}

/// @nodoc
class __$UploadingCopyWithImpl<$Res>
    extends _$ImageUploadStateCopyWithImpl<$Res>
    implements _$UploadingCopyWith<$Res> {
  __$UploadingCopyWithImpl(_Uploading _value, $Res Function(_Uploading) _then)
      : super(_value, (v) => _then(v as _Uploading));

  @override
  _Uploading get _value => super._value as _Uploading;

  @override
  $Res call({
    Object? file = freezed,
    Object? url = freezed,
  }) {
    return _then(_Uploading(
      file: file == freezed
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as XFile,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Uploading implements _Uploading {
  const _$_Uploading({required this.file, required this.url});

  @override
  final XFile file;
  @override
  final String url;

  @override
  String toString() {
    return 'ImageUploadState.uploading(file: $file, url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Uploading &&
            const DeepCollectionEquality().equals(other.file, file) &&
            const DeepCollectionEquality().equals(other.url, url));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(file),
      const DeepCollectionEquality().hash(url));

  @JsonKey(ignore: true)
  @override
  _$UploadingCopyWith<_Uploading> get copyWith =>
      __$UploadingCopyWithImpl<_Uploading>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(XFile file, String url) initial,
    required TResult Function(XFile file, String url) picked,
    required TResult Function(XFile file, String url) uploading,
    required TResult Function(XFile file, String url) uploaded,
    required TResult Function(XFile file, String url, Exception exception)
        error,
  }) {
    return uploading(file, url);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(XFile file, String url)? initial,
    TResult Function(XFile file, String url)? picked,
    TResult Function(XFile file, String url)? uploading,
    TResult Function(XFile file, String url)? uploaded,
    TResult Function(XFile file, String url, Exception exception)? error,
  }) {
    return uploading?.call(file, url);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(XFile file, String url)? initial,
    TResult Function(XFile file, String url)? picked,
    TResult Function(XFile file, String url)? uploading,
    TResult Function(XFile file, String url)? uploaded,
    TResult Function(XFile file, String url, Exception exception)? error,
    required TResult orElse(),
  }) {
    if (uploading != null) {
      return uploading(file, url);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Picked value) picked,
    required TResult Function(_Uploading value) uploading,
    required TResult Function(_Uploaded value) uploaded,
    required TResult Function(_Error value) error,
  }) {
    return uploading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Picked value)? picked,
    TResult Function(_Uploading value)? uploading,
    TResult Function(_Uploaded value)? uploaded,
    TResult Function(_Error value)? error,
  }) {
    return uploading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Picked value)? picked,
    TResult Function(_Uploading value)? uploading,
    TResult Function(_Uploaded value)? uploaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (uploading != null) {
      return uploading(this);
    }
    return orElse();
  }
}

abstract class _Uploading implements ImageUploadState {
  const factory _Uploading(
      {required final XFile file, required final String url}) = _$_Uploading;

  @override
  XFile get file => throw _privateConstructorUsedError;
  @override
  String get url => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UploadingCopyWith<_Uploading> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$UploadedCopyWith<$Res>
    implements $ImageUploadStateCopyWith<$Res> {
  factory _$UploadedCopyWith(_Uploaded value, $Res Function(_Uploaded) then) =
      __$UploadedCopyWithImpl<$Res>;
  @override
  $Res call({XFile file, String url});
}

/// @nodoc
class __$UploadedCopyWithImpl<$Res> extends _$ImageUploadStateCopyWithImpl<$Res>
    implements _$UploadedCopyWith<$Res> {
  __$UploadedCopyWithImpl(_Uploaded _value, $Res Function(_Uploaded) _then)
      : super(_value, (v) => _then(v as _Uploaded));

  @override
  _Uploaded get _value => super._value as _Uploaded;

  @override
  $Res call({
    Object? file = freezed,
    Object? url = freezed,
  }) {
    return _then(_Uploaded(
      file: file == freezed
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as XFile,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Uploaded implements _Uploaded {
  const _$_Uploaded({required this.file, required this.url});

  @override
  final XFile file;
  @override
  final String url;

  @override
  String toString() {
    return 'ImageUploadState.uploaded(file: $file, url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Uploaded &&
            const DeepCollectionEquality().equals(other.file, file) &&
            const DeepCollectionEquality().equals(other.url, url));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(file),
      const DeepCollectionEquality().hash(url));

  @JsonKey(ignore: true)
  @override
  _$UploadedCopyWith<_Uploaded> get copyWith =>
      __$UploadedCopyWithImpl<_Uploaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(XFile file, String url) initial,
    required TResult Function(XFile file, String url) picked,
    required TResult Function(XFile file, String url) uploading,
    required TResult Function(XFile file, String url) uploaded,
    required TResult Function(XFile file, String url, Exception exception)
        error,
  }) {
    return uploaded(file, url);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(XFile file, String url)? initial,
    TResult Function(XFile file, String url)? picked,
    TResult Function(XFile file, String url)? uploading,
    TResult Function(XFile file, String url)? uploaded,
    TResult Function(XFile file, String url, Exception exception)? error,
  }) {
    return uploaded?.call(file, url);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(XFile file, String url)? initial,
    TResult Function(XFile file, String url)? picked,
    TResult Function(XFile file, String url)? uploading,
    TResult Function(XFile file, String url)? uploaded,
    TResult Function(XFile file, String url, Exception exception)? error,
    required TResult orElse(),
  }) {
    if (uploaded != null) {
      return uploaded(file, url);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Picked value) picked,
    required TResult Function(_Uploading value) uploading,
    required TResult Function(_Uploaded value) uploaded,
    required TResult Function(_Error value) error,
  }) {
    return uploaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Picked value)? picked,
    TResult Function(_Uploading value)? uploading,
    TResult Function(_Uploaded value)? uploaded,
    TResult Function(_Error value)? error,
  }) {
    return uploaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Picked value)? picked,
    TResult Function(_Uploading value)? uploading,
    TResult Function(_Uploaded value)? uploaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (uploaded != null) {
      return uploaded(this);
    }
    return orElse();
  }
}

abstract class _Uploaded implements ImageUploadState {
  const factory _Uploaded(
      {required final XFile file, required final String url}) = _$_Uploaded;

  @override
  XFile get file => throw _privateConstructorUsedError;
  @override
  String get url => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UploadedCopyWith<_Uploaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ErrorCopyWith<$Res>
    implements $ImageUploadStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) then) =
      __$ErrorCopyWithImpl<$Res>;
  @override
  $Res call({XFile file, String url, Exception exception});
}

/// @nodoc
class __$ErrorCopyWithImpl<$Res> extends _$ImageUploadStateCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(_Error _value, $Res Function(_Error) _then)
      : super(_value, (v) => _then(v as _Error));

  @override
  _Error get _value => super._value as _Error;

  @override
  $Res call({
    Object? file = freezed,
    Object? url = freezed,
    Object? exception = freezed,
  }) {
    return _then(_Error(
      file: file == freezed
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as XFile,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      exception: exception == freezed
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as Exception,
    ));
  }
}

/// @nodoc

class _$_Error implements _Error {
  const _$_Error(
      {required this.file, required this.url, required this.exception});

  @override
  final XFile file;
  @override
  final String url;
  @override
  final Exception exception;

  @override
  String toString() {
    return 'ImageUploadState.error(file: $file, url: $url, exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Error &&
            const DeepCollectionEquality().equals(other.file, file) &&
            const DeepCollectionEquality().equals(other.url, url) &&
            const DeepCollectionEquality().equals(other.exception, exception));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(file),
      const DeepCollectionEquality().hash(url),
      const DeepCollectionEquality().hash(exception));

  @JsonKey(ignore: true)
  @override
  _$ErrorCopyWith<_Error> get copyWith =>
      __$ErrorCopyWithImpl<_Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(XFile file, String url) initial,
    required TResult Function(XFile file, String url) picked,
    required TResult Function(XFile file, String url) uploading,
    required TResult Function(XFile file, String url) uploaded,
    required TResult Function(XFile file, String url, Exception exception)
        error,
  }) {
    return error(file, url, exception);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(XFile file, String url)? initial,
    TResult Function(XFile file, String url)? picked,
    TResult Function(XFile file, String url)? uploading,
    TResult Function(XFile file, String url)? uploaded,
    TResult Function(XFile file, String url, Exception exception)? error,
  }) {
    return error?.call(file, url, exception);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(XFile file, String url)? initial,
    TResult Function(XFile file, String url)? picked,
    TResult Function(XFile file, String url)? uploading,
    TResult Function(XFile file, String url)? uploaded,
    TResult Function(XFile file, String url, Exception exception)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(file, url, exception);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Picked value) picked,
    required TResult Function(_Uploading value) uploading,
    required TResult Function(_Uploaded value) uploaded,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Picked value)? picked,
    TResult Function(_Uploading value)? uploading,
    TResult Function(_Uploaded value)? uploaded,
    TResult Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Picked value)? picked,
    TResult Function(_Uploading value)? uploading,
    TResult Function(_Uploaded value)? uploaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements ImageUploadState {
  const factory _Error(
      {required final XFile file,
      required final String url,
      required final Exception exception}) = _$_Error;

  @override
  XFile get file => throw _privateConstructorUsedError;
  @override
  String get url => throw _privateConstructorUsedError;
  Exception get exception => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ErrorCopyWith<_Error> get copyWith => throw _privateConstructorUsedError;
}
