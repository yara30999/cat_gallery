import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../../app/extensions.dart';
import '../../../../app/functions.dart';
import '../../../../data/network/failure.dart';
import '../../../../domain/entities/cat_with_click_entity.dart';
import '../../../../domain/usecase/get_category_images_usecase.dart';
import '../../../../domain/usecase/get_no_category_images_usecase.dart';
import '../../../../generated/l10n.dart';

part 'no_breed_event.dart';
part 'no_breed_state.dart';

class NoBreedBloc extends Bloc<NoBreedEvent, NoBreedState> {
  final GetNoCategoryImagesUsecase _getNoCategoryImagesUsecase;
  final GetCategoryImagesUsecase _getCategoryImagesUsecase;
  int _categoryId = 0; //initial val
  String _sorting = SortingItem.random.apiValue; //initial val
  List<CatWithClickEntity> _items = [];
  NoBreedBloc(this._getNoCategoryImagesUsecase, this._getCategoryImagesUsecase)
      : super(const NoBreedInitial([], isLoading: false)) {
    // Initialize catBreedsList in the constructor body
    _items = generateDummyCatImagesList();

    on<NoBreedEvent>((event, emit) async {
      if (event is CategoryEvent) {
        _categoryId = event.categoryId;
      }

      if (event is SortingEvent) {
        _sorting = event.sorting;
      }

      if (event is CategoryImagesEvent) {
        if (event.pageNum == 0) {
          emit(NoBreedLoading(_items, isLoading: true));
        } else {
          emit(NoBreedPaginationLoading(_items, isLoading: false));
        }

        Either<Failure, List<CatWithClickEntity>> result;
        if (_categoryId == 0) {
          result = await _getNoCategoryImagesUsecase.execute(
              NoCategoryImagesUseCaseInput(event.uid, event.pageNum, _sorting));
        } else {
          result = await _getCategoryImagesUsecase.execute(
              CategoryImagesUseCaseInput(
                  event.uid, _categoryId.toString(), event.pageNum, _sorting));
        }

        result.fold((failure) {
          var errMessage =
              '${failure.message.toString()} ${failure.code.toString()}';
          if (event.pageNum == 0) {
            emit(NoBreedFailure(_items, errMessage, isLoading: false));
          } else {
            emit(
                NoBreedPaginationFailure(_items, errMessage, isLoading: false));
          }
        }, (catImagesSuccess) async {
          if (event.pageNum == 0) {
            if (catImagesSuccess.isEmpty) {
              emit(NoBreedSuccessFirstPageEmpty(_items, isLoading: false));
            } else {
              _items.clear();
              _items.addAll(catImagesSuccess);
              emit(NoBreedSuccess(_items, isLoading: false));
            }
          } else {
            if (catImagesSuccess.isEmpty) {
              var errMessage = S.current.no_more_cat_images;
              emit(NoBreedPaginationFailure(_items, errMessage,
                  isLoading: false));
            } else {
              _items.addAll(catImagesSuccess);
              emit(NoBreedPaginationSuccess(_items, isLoading: false));
            }
          }
        });
      }
    });
  }
}
