// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'no_breed_bloc.dart';

@immutable
sealed class NoBreedEvent {}

class CategoryImagesEvent extends NoBreedEvent {
  final String uid;

  final int pageNum;

  CategoryImagesEvent({required this.uid, required this.pageNum});
}

class CategoryEvent extends NoBreedEvent {
  final int categoryId;
  CategoryEvent(
    this.categoryId,
  );
}

class SortingEvent extends NoBreedEvent {
  final String sorting;
  SortingEvent(
    this.sorting,
  );
}
