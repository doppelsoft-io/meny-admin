// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delete_resource_button.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DeleteResourceButtonArgs {
  void Function()? get onPressed => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DeleteResourceButtonArgsCopyWith<DeleteResourceButtonArgs> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeleteResourceButtonArgsCopyWith<$Res> {
  factory $DeleteResourceButtonArgsCopyWith(DeleteResourceButtonArgs value,
          $Res Function(DeleteResourceButtonArgs) then) =
      _$DeleteResourceButtonArgsCopyWithImpl<$Res, DeleteResourceButtonArgs>;
  @useResult
  $Res call({void Function()? onPressed, String text});
}

/// @nodoc
class _$DeleteResourceButtonArgsCopyWithImpl<$Res,
        $Val extends DeleteResourceButtonArgs>
    implements $DeleteResourceButtonArgsCopyWith<$Res> {
  _$DeleteResourceButtonArgsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? onPressed = freezed,
    Object? text = null,
  }) {
    return _then(_value.copyWith(
      onPressed: freezed == onPressed
          ? _value.onPressed
          : onPressed // ignore: cast_nullable_to_non_nullable
              as void Function()?,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DeleteResourceButtonArgsCopyWith<$Res>
    implements $DeleteResourceButtonArgsCopyWith<$Res> {
  factory _$$_DeleteResourceButtonArgsCopyWith(
          _$_DeleteResourceButtonArgs value,
          $Res Function(_$_DeleteResourceButtonArgs) then) =
      __$$_DeleteResourceButtonArgsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({void Function()? onPressed, String text});
}

/// @nodoc
class __$$_DeleteResourceButtonArgsCopyWithImpl<$Res>
    extends _$DeleteResourceButtonArgsCopyWithImpl<$Res,
        _$_DeleteResourceButtonArgs>
    implements _$$_DeleteResourceButtonArgsCopyWith<$Res> {
  __$$_DeleteResourceButtonArgsCopyWithImpl(_$_DeleteResourceButtonArgs _value,
      $Res Function(_$_DeleteResourceButtonArgs) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? onPressed = freezed,
    Object? text = null,
  }) {
    return _then(_$_DeleteResourceButtonArgs(
      onPressed: freezed == onPressed
          ? _value.onPressed
          : onPressed // ignore: cast_nullable_to_non_nullable
              as void Function()?,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_DeleteResourceButtonArgs implements _DeleteResourceButtonArgs {
  const _$_DeleteResourceButtonArgs(
      {required this.onPressed, this.text = 'Delete'});

  @override
  final void Function()? onPressed;
  @override
  @JsonKey()
  final String text;

  @override
  String toString() {
    return 'DeleteResourceButtonArgs(onPressed: $onPressed, text: $text)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeleteResourceButtonArgs &&
            (identical(other.onPressed, onPressed) ||
                other.onPressed == onPressed) &&
            (identical(other.text, text) || other.text == text));
  }

  @override
  int get hashCode => Object.hash(runtimeType, onPressed, text);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeleteResourceButtonArgsCopyWith<_$_DeleteResourceButtonArgs>
      get copyWith => __$$_DeleteResourceButtonArgsCopyWithImpl<
          _$_DeleteResourceButtonArgs>(this, _$identity);
}

abstract class _DeleteResourceButtonArgs implements DeleteResourceButtonArgs {
  const factory _DeleteResourceButtonArgs(
      {required final void Function()? onPressed,
      final String text}) = _$_DeleteResourceButtonArgs;

  @override
  void Function()? get onPressed;
  @override
  String get text;
  @override
  @JsonKey(ignore: true)
  _$$_DeleteResourceButtonArgsCopyWith<_$_DeleteResourceButtonArgs>
      get copyWith => throw _privateConstructorUsedError;
}
