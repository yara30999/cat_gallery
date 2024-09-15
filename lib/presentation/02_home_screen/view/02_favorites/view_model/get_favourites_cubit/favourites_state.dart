part of 'favourites_cubit.dart';

@immutable
sealed class FavouritesState {
  final bool isLoading;
  final List<CatWithClickEntity> imageItems;
  const FavouritesState(this.imageItems, {required this.isLoading});
}

final class FavouritesInitial extends FavouritesState {
  const FavouritesInitial(super.imageItems, {required super.isLoading});
}

class FavouritesLoading extends FavouritesState {
  const FavouritesLoading(super.imageItems, {required super.isLoading});
}

class FavouritesFailure extends FavouritesState {
  final String errMessage;

  const FavouritesFailure(super.imageItems, this.errMessage,
      {required super.isLoading});
}

class FavouritesSuccess extends FavouritesState {
  const FavouritesSuccess(super.imageItems, {required super.isLoading});
}

class FavouritesSuccessFirstPageEmpty extends FavouritesState {
  const FavouritesSuccessFirstPageEmpty(super.imageItems,
      {required super.isLoading});
}

////////////////////////////////////////////////////////////////////////////

class FavouritesPaginationLoading extends FavouritesState {
  const FavouritesPaginationLoading(super.imageItems,
      {required super.isLoading});
}

class FavouritesPaginationFailure extends FavouritesState {
  final String errMessage;

  const FavouritesPaginationFailure(super.imageItems, this.errMessage,
      {required super.isLoading});
}

class FavouritesPaginationSuccess extends FavouritesState {
  const FavouritesPaginationSuccess(super.imageItems,
      {required super.isLoading});
}
