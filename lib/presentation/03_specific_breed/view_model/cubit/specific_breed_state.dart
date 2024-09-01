part of 'specific_breed_cubit.dart';

@immutable
sealed class SpecificBreedState {}

final class SpecificBreedInitial extends SpecificBreedState {}

final class SpecificBreedLoading extends SpecificBreedState {}

final class SpecificBreedSuccess extends SpecificBreedState {
  final CatBreedEntity catBreedEntity;
  SpecificBreedSuccess({required this.catBreedEntity});
}

final class SpecificBreedFailure extends SpecificBreedState {
  final String errMessage;

  SpecificBreedFailure({required this.errMessage});
}
