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
abstract class _$$_InitialCopyWith<$Res>
    implements $ImageUploadStateCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
  @override
  $Res call({XFile file, String url});
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$ImageUploadStateCopyWithImpl<$Res>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, (v) => _then(v as _$_Initial));

  @override
  _$_Initial get _value => super._value as _$_Initial;

  @override
  $Res call({
    Object? file = freezed,
    Object? url = freezed,
  }) {
    return _then(_$_Initial(
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
            other is _$_Initial &&
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
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      __$$_InitialCopyWithImpl<_$_Initial>(this, _$identity);

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
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_PickedCopyWith<$Res>
    implements $ImageUploadStateCopyWith<$Res> {
  factory _$$_PickedCopyWith(_$_Picked value, $Res Function(_$_Picked) then) =
      __$$_PickedCopyWithImpl<$Res>;
  @override
  $Res call({XFile file, String url});
}

/// @nodoc
class __$$_PickedCopyWithImpl<$Res> extends _$ImageUploadStateCopyWithImpl<$Res>
    implements _$$_PickedCopyWith<$Res> {
  __$$_PickedCopyWithImpl(_$_Picked _value, $Res Function(_$_Picked) _then)
      : super(_value, (v) => _then(v as _$_Picked));

  @override
  _$_Picked get _value => super._value as _$_Picked;

  @override
  $Res call({
    Object? file = freezed,
    Object? url = freezed,
  }) {
    return _then(_$_Picked(
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
            other is _$_Picked &&
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
  _$$_PickedCopyWith<_$_Picked> get copyWith =>
      __$$_PickedCopyWithImpl<_$_Picked>(this, _$identity);

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
  _$$_PickedCopyWith<_$_Picked> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UploadingCopyWith<$Res>
    implements $ImageUploadStateCopyWith<$Res> {
  factory _$$_UploadingCopyWith(
          _$_Uploading value, $Res Function(_$_Uploading) then) =
      __$$_UploadingCopyWithImpl<$Res>;
  @override
  $Res call({XFile file, String url});
}

/// @nodoc
class __$$_UploadingCopyWithImpl<$Res>
    extends _$ImageUploadStateCopyWithImpl<$Res>
    implements _$$_UploadingCopyWith<$Res> {
  __$$_UploadingCopyWithImpl(
      _$_Uploading _value, $Res Function(_$_Uploading) _then)
      : super(_value, (v) => _then(v as _$_Uploading));

  @override
  _$_Uploading get _value => super._value as _$_Uploading;

  @override
  $Res call({
    Object? file = freezed,
    Object? url = freezed,
  }) {
    return _then(_$_Uploading(
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
            other is _$_Uploading &&
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
  _$$_UploadingCopyWith<_$_Uploading> get copyWith =>
      __$$_UploadingCopyWithImpl<_$_Uploading>(this, _$identity);

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
  _$$_UploadingCopyWith<_$_Uploading> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UploadedCopyWith<$Res>
    implements $ImageUploadStateCopyWith<$Res> {
  factory _$$_UploadedCopyWith(
          _$_Uploaded value, $Res Function(_$_Uploaded) then) =
      __$$_UploadedCopyWithImpl<$Res>;
  @override
  $Res call({XFile file, String url});
}

/// @nodoc
class __$$_UploadedCopyWithImpl<$Res>
    extends _$ImageUploadStateCopyWithImpl<$Res>
    implements _$$_UploadedCopyWith<$Res> {
  __$$_UploadedCopyWithImpl(
      _$_Uploaded _value, $Res Function(_$_Uploaded) _then)
      : super(_value, (v) => _then(v as _$_Uploaded));

  @override
  _$_Uploaded get _value => super._value as _$_Uploaded;

  @override
  $Res call({
    Object? file = freezed,
    Object? url = freezed,
  }) {
    return _then(_$_Uploaded(
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
            other is _$_Uploaded &&
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
  _$$_UploadedCopyWith<_$_Uploaded> get copyWith =>
      __$$_UploadedCopyWithImpl<_$_Uploaded>(this, _$identity);

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
  _$$_UploadedCopyWith<_$_Uploaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ErrorCopyWith<$Res>
    implements $ImageUploadStateCopyWith<$Res> {
  factory _$$_ErrorCopyWith(_$_Error value, $Res Function(_$_Error) then) =
      __$$_ErrorCopyWithImpl<$Res>;
  @override
  $Res call({XFile file, String url, Exception exception});
}

/// @nodoc
class __$$_ErrorCopyWithImpl<$Res> extends _$ImageUploadStateCopyWithImpl<$Res>
    implements _$$_ErrorCopyWith<$Res> {
  __$$_ErrorCopyWithImpl(_$_Error _value, $Res Function(_$_Error) _then)
      : super(_value, (v) => _then(v as _$_Error));

  @override
  _$_Error get _value => super._value as _$_Error;

  @override
  $Res call({
    Object? file = freezed,
    Object? url = freezed,
    Object? exception = freezed,
  }) {
    return _then(_$_Error(
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
            other is _$_Error &&
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
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
      __$$_ErrorCopyWithImpl<_$_Error>(this, _$identity);

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
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
      throw _privateConstructorUsedError;
}
