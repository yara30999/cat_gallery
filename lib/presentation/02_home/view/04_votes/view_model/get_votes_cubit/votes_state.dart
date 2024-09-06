part of 'votes_cubit.dart';

@immutable
sealed class VotesState {
  final bool isLoading;
  final List<CatWithClickEntity> imageItems;
  const VotesState(this.imageItems, {required this.isLoading});
}

final class VotesInitial extends VotesState {
  const VotesInitial(super.imageItems, {required super.isLoading});
}

class VotesLoading extends VotesState {
  const VotesLoading(super.imageItems, {required super.isLoading});
}

class VotesFailure extends VotesState {
  final String errMessage;

  const VotesFailure(super.imageItems, this.errMessage,
      {required super.isLoading});
}

class VotesSuccess extends VotesState {
  const VotesSuccess(super.imageItems, {required super.isLoading});
}

class VotesSuccessFirstPageEmpty extends VotesState {
  const VotesSuccessFirstPageEmpty(super.imageItems,
      {required super.isLoading});
}

////////////////////////////////////////////////////////////////////////////

class VotesPaginationLoading extends VotesState {
  const VotesPaginationLoading(super.imageItems, {required super.isLoading});
}

class VotesPaginationFailure extends VotesState {
  final String errMessage;

  const VotesPaginationFailure(super.imageItems, this.errMessage,
      {required super.isLoading});
}

class VotesPaginationSuccess extends VotesState {
  const VotesPaginationSuccess(super.imageItems, {required super.isLoading});
}
