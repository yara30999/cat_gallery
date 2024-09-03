part of 'specific_images_cubit.dart';

@immutable
sealed class SpecificImagesState {
  final bool isLoading;
  final List<CatWithClickEntity> imageItems;
  const SpecificImagesState(this.imageItems, {required this.isLoading});
}

final class SpecificImagesInitial extends SpecificImagesState {
  const SpecificImagesInitial(super.imageItems, {required super.isLoading});
}

class SpecificImagesLoading extends SpecificImagesState {
  const SpecificImagesLoading(super.imageItems, {required super.isLoading});
}

class SpecificImagesFailure extends SpecificImagesState {
  final String errMessage;

  const SpecificImagesFailure(super.imageItems, this.errMessage,
      {required super.isLoading});
}

class SpecificImagesSuccess extends SpecificImagesState {
  const SpecificImagesSuccess(super.imageItems, {required super.isLoading});
}

////////////////////////////////////////////////////////////////////////////

class SpecificImagesPaginationLoading extends SpecificImagesState {
  const SpecificImagesPaginationLoading(super.imageItems,
      {required super.isLoading});
}

class SpecificImagesPaginationFailure extends SpecificImagesState {
  final String errMessage;

  const SpecificImagesPaginationFailure(super.imageItems, this.errMessage,
      {required super.isLoading});
}

class SpecificImagesPaginationSuccess extends SpecificImagesState {
  const SpecificImagesPaginationSuccess(super.imageItems,
      {required super.isLoading});
}
