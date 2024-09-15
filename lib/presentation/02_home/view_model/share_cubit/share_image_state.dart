part of 'share_image_cubit.dart';

@immutable
sealed class ShareImageState {}

final class ShareImageInitial extends ShareImageState {}

final class ShareImageLoading extends ShareImageState {}

final class ShareImageFailure extends ShareImageState {
  final String errMessage;

  ShareImageFailure({required this.errMessage});
}

final class ShareImageSuccess extends ShareImageState {}
