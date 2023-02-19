// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signup_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SignupState {
  StoreModel get store => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(StoreModel store, String email, String password)
        initial,
    required TResult Function(StoreModel store, String email, String password)
        signingIn,
    required TResult Function(StoreModel store, String email, String password,
            Either<CustomException, bool> result)
        done,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(StoreModel store, String email, String password)? initial,
    TResult? Function(StoreModel store, String email, String password)?
        signingIn,
    TResult? Function(StoreModel store, String email, String password,
            Either<CustomException, bool> result)?
        done,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(StoreModel store, String email, String password)? initial,
    TResult Function(StoreModel store, String email, String password)?
        signingIn,
    TResult Function(StoreModel store, String email, String password,
            Either<CustomException, bool> result)?
        done,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_SigningIn value) signingIn,
    required TResult Function(_Done value) done,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_SigningIn value)? signingIn,
    TResult? Function(_Done value)? done,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SigningIn value)? signingIn,
    TResult Function(_Done value)? done,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignupStateCopyWith<SignupState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignupStateCopyWith<$Res> {
  factory $SignupStateCopyWith(
          SignupState value, $Res Function(SignupState) then) =
      _$SignupStateCopyWithImpl<$Res, SignupState>;
  @useResult
  $Res call({StoreModel store, String email, String password});

  $StoreModelCopyWith<$Res> get store;
}

/// @nodoc
class _$SignupStateCopyWithImpl<$Res, $Val extends SignupState>
    implements $SignupStateCopyWith<$Res> {
  _$SignupStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? store = null,
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      store: null == store
          ? _value.store
          : store // ignore: cast_nullable_to_non_nullable
              as StoreModel,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
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
abstract class _$$_InitialCopyWith<$Res> implements $SignupStateCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({StoreModel store, String email, String password});

  @override
  $StoreModelCopyWith<$Res> get store;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$SignupStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? store = null,
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$_Initial(
      store: null == store
          ? _value.store
          : store // ignore: cast_nullable_to_non_nullable
              as StoreModel,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial({required this.store, this.email = '', this.password = ''});

  @override
  final StoreModel store;
  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final String password;

  @override
  String toString() {
    return 'SignupState.initial(store: $store, email: $email, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initial &&
            (identical(other.store, store) || other.store == store) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, store, email, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      __$$_InitialCopyWithImpl<_$_Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(StoreModel store, String email, String password)
        initial,
    required TResult Function(StoreModel store, String email, String password)
        signingIn,
    required TResult Function(StoreModel store, String email, String password,
            Either<CustomException, bool> result)
        done,
  }) {
    return initial(store, email, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(StoreModel store, String email, String password)? initial,
    TResult? Function(StoreModel store, String email, String password)?
        signingIn,
    TResult? Function(StoreModel store, String email, String password,
            Either<CustomException, bool> result)?
        done,
  }) {
    return initial?.call(store, email, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(StoreModel store, String email, String password)? initial,
    TResult Function(StoreModel store, String email, String password)?
        signingIn,
    TResult Function(StoreModel store, String email, String password,
            Either<CustomException, bool> result)?
        done,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(store, email, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_SigningIn value) signingIn,
    required TResult Function(_Done value) done,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_SigningIn value)? signingIn,
    TResult? Function(_Done value)? done,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SigningIn value)? signingIn,
    TResult Function(_Done value)? done,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements SignupState {
  const factory _Initial(
      {required final StoreModel store,
      final String email,
      final String password}) = _$_Initial;

  @override
  StoreModel get store;
  @override
  String get email;
  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SigningInCopyWith<$Res>
    implements $SignupStateCopyWith<$Res> {
  factory _$$_SigningInCopyWith(
          _$_SigningIn value, $Res Function(_$_SigningIn) then) =
      __$$_SigningInCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({StoreModel store, String email, String password});

  @override
  $StoreModelCopyWith<$Res> get store;
}

/// @nodoc
class __$$_SigningInCopyWithImpl<$Res>
    extends _$SignupStateCopyWithImpl<$Res, _$_SigningIn>
    implements _$$_SigningInCopyWith<$Res> {
  __$$_SigningInCopyWithImpl(
      _$_SigningIn _value, $Res Function(_$_SigningIn) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? store = null,
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$_SigningIn(
      store: null == store
          ? _value.store
          : store // ignore: cast_nullable_to_non_nullable
              as StoreModel,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SigningIn implements _SigningIn {
  const _$_SigningIn(
      {required this.store, required this.email, required this.password});

  @override
  final StoreModel store;
  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'SignupState.signingIn(store: $store, email: $email, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SigningIn &&
            (identical(other.store, store) || other.store == store) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, store, email, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SigningInCopyWith<_$_SigningIn> get copyWith =>
      __$$_SigningInCopyWithImpl<_$_SigningIn>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(StoreModel store, String email, String password)
        initial,
    required TResult Function(StoreModel store, String email, String password)
        signingIn,
    required TResult Function(StoreModel store, String email, String password,
            Either<CustomException, bool> result)
        done,
  }) {
    return signingIn(store, email, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(StoreModel store, String email, String password)? initial,
    TResult? Function(StoreModel store, String email, String password)?
        signingIn,
    TResult? Function(StoreModel store, String email, String password,
            Either<CustomException, bool> result)?
        done,
  }) {
    return signingIn?.call(store, email, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(StoreModel store, String email, String password)? initial,
    TResult Function(StoreModel store, String email, String password)?
        signingIn,
    TResult Function(StoreModel store, String email, String password,
            Either<CustomException, bool> result)?
        done,
    required TResult orElse(),
  }) {
    if (signingIn != null) {
      return signingIn(store, email, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_SigningIn value) signingIn,
    required TResult Function(_Done value) done,
  }) {
    return signingIn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_SigningIn value)? signingIn,
    TResult? Function(_Done value)? done,
  }) {
    return signingIn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SigningIn value)? signingIn,
    TResult Function(_Done value)? done,
    required TResult orElse(),
  }) {
    if (signingIn != null) {
      return signingIn(this);
    }
    return orElse();
  }
}

abstract class _SigningIn implements SignupState {
  const factory _SigningIn(
      {required final StoreModel store,
      required final String email,
      required final String password}) = _$_SigningIn;

  @override
  StoreModel get store;
  @override
  String get email;
  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  _$$_SigningInCopyWith<_$_SigningIn> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_DoneCopyWith<$Res> implements $SignupStateCopyWith<$Res> {
  factory _$$_DoneCopyWith(_$_Done value, $Res Function(_$_Done) then) =
      __$$_DoneCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {StoreModel store,
      String email,
      String password,
      Either<CustomException, bool> result});

  @override
  $StoreModelCopyWith<$Res> get store;
}

/// @nodoc
class __$$_DoneCopyWithImpl<$Res>
    extends _$SignupStateCopyWithImpl<$Res, _$_Done>
    implements _$$_DoneCopyWith<$Res> {
  __$$_DoneCopyWithImpl(_$_Done _value, $Res Function(_$_Done) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? store = null,
    Object? email = null,
    Object? password = null,
    Object? result = null,
  }) {
    return _then(_$_Done(
      store: null == store
          ? _value.store
          : store // ignore: cast_nullable_to_non_nullable
              as StoreModel,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as Either<CustomException, bool>,
    ));
  }
}

/// @nodoc

class _$_Done implements _Done {
  const _$_Done(
      {required this.store,
      required this.email,
      required this.password,
      required this.result});

  @override
  final StoreModel store;
  @override
  final String email;
  @override
  final String password;
  @override
  final Either<CustomException, bool> result;

  @override
  String toString() {
    return 'SignupState.done(store: $store, email: $email, password: $password, result: $result)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Done &&
            (identical(other.store, store) || other.store == store) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.result, result) || other.result == result));
  }

  @override
  int get hashCode => Object.hash(runtimeType, store, email, password, result);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DoneCopyWith<_$_Done> get copyWith =>
      __$$_DoneCopyWithImpl<_$_Done>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(StoreModel store, String email, String password)
        initial,
    required TResult Function(StoreModel store, String email, String password)
        signingIn,
    required TResult Function(StoreModel store, String email, String password,
            Either<CustomException, bool> result)
        done,
  }) {
    return done(store, email, password, result);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(StoreModel store, String email, String password)? initial,
    TResult? Function(StoreModel store, String email, String password)?
        signingIn,
    TResult? Function(StoreModel store, String email, String password,
            Either<CustomException, bool> result)?
        done,
  }) {
    return done?.call(store, email, password, result);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(StoreModel store, String email, String password)? initial,
    TResult Function(StoreModel store, String email, String password)?
        signingIn,
    TResult Function(StoreModel store, String email, String password,
            Either<CustomException, bool> result)?
        done,
    required TResult orElse(),
  }) {
    if (done != null) {
      return done(store, email, password, result);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_SigningIn value) signingIn,
    required TResult Function(_Done value) done,
  }) {
    return done(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_SigningIn value)? signingIn,
    TResult? Function(_Done value)? done,
  }) {
    return done?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SigningIn value)? signingIn,
    TResult Function(_Done value)? done,
    required TResult orElse(),
  }) {
    if (done != null) {
      return done(this);
    }
    return orElse();
  }
}

abstract class _Done implements SignupState {
  const factory _Done(
      {required final StoreModel store,
      required final String email,
      required final String password,
      required final Either<CustomException, bool> result}) = _$_Done;

  @override
  StoreModel get store;
  @override
  String get email;
  @override
  String get password;
  Either<CustomException, bool> get result;
  @override
  @JsonKey(ignore: true)
  _$$_DoneCopyWith<_$_Done> get copyWith => throw _privateConstructorUsedError;
}
