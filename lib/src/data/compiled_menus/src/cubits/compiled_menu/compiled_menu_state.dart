part of 'compiled_menu_cubit.dart';

@freezed
class CompiledMenuState with _$CompiledMenuState {
  const factory CompiledMenuState.loading({
    required CompiledMenuModel response,
  }) = _Loading;

  const factory CompiledMenuState.loaded({
    required CompiledMenuModel response,
  }) = _Loaded;

  const factory CompiledMenuState.publishing({
    required CompiledMenuModel response,
  }) = _Publishing;

  const factory CompiledMenuState.published({
    required CompiledMenuModel response,
  }) = _Published;

  const factory CompiledMenuState.error({
    required CompiledMenuModel response,
    required Exception exception,
  }) = _Error;
}
