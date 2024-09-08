part of 'delete_image_cubit.dart';

@immutable
sealed class DeleteImageState {}

final class DeleteImageInitial extends DeleteImageState {}

class DeleteImageLoading extends DeleteImageState {}

class DeleteImageFailure extends DeleteImageState {
  final String errMessage;

  DeleteImageFailure({required this.errMessage});
}

class DeleteImageSuccess extends DeleteImageState {}
