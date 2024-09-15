part of 'like_unlike_cubit.dart';

@immutable
sealed class LikeUnlikeState {
  final Favourite? favouriteData;
  const LikeUnlikeState(this.favouriteData);
}

final class LikeUnlikeInitial extends LikeUnlikeState {
  const LikeUnlikeInitial(super.favouriteData);
}

class LikeUnlikeLoading extends LikeUnlikeState {
  const LikeUnlikeLoading(super.favouriteData);
}

class LikeUnlikeFailure extends LikeUnlikeState {
  final String errMessage;

  const LikeUnlikeFailure(super.favouriteData, {required this.errMessage});
}

class LikeUnlikeSuccess extends LikeUnlikeState {
  const LikeUnlikeSuccess(super.favouriteData);
}
