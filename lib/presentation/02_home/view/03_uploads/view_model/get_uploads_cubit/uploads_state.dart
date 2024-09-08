part of 'uploads_cubit.dart';

@immutable
sealed class UploadsState {
  final bool isLoading;
  final List<CatWithClickEntity> imageItems;
  const UploadsState(this.imageItems, {required this.isLoading});
}

final class UploadsInitial extends UploadsState {
  const UploadsInitial(super.imageItems, {required super.isLoading});
}

class UploadsLoading extends UploadsState {
  const UploadsLoading(super.imageItems, {required super.isLoading});
}

class UploadsFailure extends UploadsState {
  final String errMessage;

  const UploadsFailure(super.imageItems, this.errMessage,
      {required super.isLoading});
}

class UploadsSuccess extends UploadsState {
  const UploadsSuccess(super.imageItems, {required super.isLoading});
}

class UploadsSuccessFirstPageEmpty extends UploadsState {
  const UploadsSuccessFirstPageEmpty(super.imageItems,
      {required super.isLoading});
}

////////////////////////////////////////////////////////////////////////////

class UploadsPaginationLoading extends UploadsState {
  const UploadsPaginationLoading(super.imageItems, {required super.isLoading});
}

class UploadsPaginationFailure extends UploadsState {
  final String errMessage;

  const UploadsPaginationFailure(super.imageItems, this.errMessage,
      {required super.isLoading});
}

class UploadsPaginationSuccess extends UploadsState {
  const UploadsPaginationSuccess(super.imageItems, {required super.isLoading});
}
