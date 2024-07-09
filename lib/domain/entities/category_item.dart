import '../../generated/l10n.dart';
import '../../presentation/resources/assets_manager.dart';

class CategoryItemEntity {
  final int index;
  final String name;
  final String svgIcon;

  const CategoryItemEntity(
      {required this.name, required this.svgIcon, required this.index});

  static List<CategoryItemEntity> get items => [
        CategoryItemEntity(
            index: 0, name: S.current.all, svgIcon: SvgAssets.all),
        CategoryItemEntity(
            index: 1, name: S.current.hats, svgIcon: SvgAssets.hats),
        CategoryItemEntity(
            index: 2, name: S.current.space, svgIcon: SvgAssets.space),
        CategoryItemEntity(
            index: 3, name: S.current.funny, svgIcon: SvgAssets.funny),
        CategoryItemEntity(
            index: 4,
            name: S.current.sunglasses,
            svgIcon: SvgAssets.sunglasses),
        CategoryItemEntity(
            index: 5, name: S.current.boxes, svgIcon: SvgAssets.boxes),
        CategoryItemEntity(
            index: 6, name: S.current.caturday, svgIcon: SvgAssets.caturday),
        CategoryItemEntity(
            index: 7, name: S.current.ties, svgIcon: SvgAssets.ties),
        CategoryItemEntity(
            index: 8, name: S.current.boys, svgIcon: SvgAssets.boys),
        CategoryItemEntity(
            index: 9, name: S.current.dream, svgIcon: SvgAssets.dream),
        CategoryItemEntity(
            index: 10, name: S.current.kittens, svgIcon: SvgAssets.kittens),
        CategoryItemEntity(
            index: 11,
            name: S.current.psychedelic,
            svgIcon: SvgAssets.psychedelic),
        CategoryItemEntity(
            index: 12, name: S.current.girls, svgIcon: SvgAssets.girls),
        CategoryItemEntity(
            index: 13, name: S.current.breaded, svgIcon: SvgAssets.breaded),
        CategoryItemEntity(
            index: 14, name: S.current.sinks, svgIcon: SvgAssets.sinks),
        CategoryItemEntity(
            index: 15, name: S.current.clothes, svgIcon: SvgAssets.clothes),
      ];
}
