part of 'no_breed_bloc.dart';

@immutable
sealed class NoBreedState {
  final bool isLoading;
  final List<CatWithClickEntity> imageItems;
  const NoBreedState(this.imageItems, {required this.isLoading});
}

final class NoBreedInitial extends NoBreedState {
  const NoBreedInitial(super.imageItems, {required super.isLoading});
}

class NoBreedLoading extends NoBreedState {
  const NoBreedLoading(super.imageItems, {required super.isLoading});
}

class NoBreedFailure extends NoBreedState {
  final String errMessage;

  const NoBreedFailure(super.imageItems, this.errMessage,
      {required super.isLoading});
}

class NoBreedSuccess extends NoBreedState {
  const NoBreedSuccess(super.imageItems, {required super.isLoading});
}

class NoBreedSuccessFirstPageEmpty extends NoBreedState {
  const NoBreedSuccessFirstPageEmpty(super.imageItems,
      {required super.isLoading});
}

////////////////////////////////////////////////////////////////////////////

class NoBreedPaginationLoading extends NoBreedState {
  const NoBreedPaginationLoading(super.imageItems, {required super.isLoading});
}

class NoBreedPaginationFailure extends NoBreedState {
  final String errMessage;

  const NoBreedPaginationFailure(super.imageItems, this.errMessage,
      {required super.isLoading});
}

class NoBreedPaginationSuccess extends NoBreedState {
  const NoBreedPaginationSuccess(super.imageItems, {required super.isLoading});
}
