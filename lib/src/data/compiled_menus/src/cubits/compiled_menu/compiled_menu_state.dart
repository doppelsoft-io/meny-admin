part of 'compiled_menu_cubit.dart';

typedef CategoryMenuItemMap = Tuple2<CategoryModel, List<MenuItemModel>>;
typedef MenuResponse = Tuple2<MenuModel, List<CategoryMenuItemMap>>;

@freezed
class CompiledMenuState with _$CompiledMenuState {
  const factory CompiledMenuState.loading({
    required MenuResponse response,
  }) = _Loading;

  const factory CompiledMenuState.loaded({
    required MenuResponse response,
  }) = _Loaded;

  const factory CompiledMenuState.error({
    required MenuResponse response,
    required Exception exception,
  }) = _Error;
}
