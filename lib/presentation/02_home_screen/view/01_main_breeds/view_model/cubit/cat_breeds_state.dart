part of 'cat_breeds_cubit.dart';

@immutable
sealed class CatBreedsState {
  final bool loading;
  final List<CatBreedCardEntity> breedsItems;
  const CatBreedsState(this.breedsItems, {required this.loading});
}

final class CatBreedsInitial extends CatBreedsState {
  const CatBreedsInitial(super.breedsItems, {required super.loading});
}

final class CatBreedsLoading extends CatBreedsState {
  const CatBreedsLoading(super.breedsItems, {required super.loading});
}

final class CatBreedsSuccess extends CatBreedsState {
  const CatBreedsSuccess(super.breedsItems, {required super.loading});
}

final class CatBreedsFailure extends CatBreedsState {
  final String errMessage;

  const CatBreedsFailure(super.breedsItems,
      {required this.errMessage, required super.loading});
}
