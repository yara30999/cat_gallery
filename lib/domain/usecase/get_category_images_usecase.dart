import 'package:dartz/dartz.dart';
import '../../data/network/failure.dart';
import '../../data/network/requests.dart';
import '../entities/cat_with_click_entity.dart';
import '../repository/repository.dart';
import 'base_usecase.dart';

class GetCategoryImagesUsecase
    implements
        BaseUseCase<CategoryImagesUseCaseInput, List<CatWithClickEntity>> {
  final Repository _repository;

  GetCategoryImagesUsecase(this._repository);

  @override
  Future<Either<Failure, List<CatWithClickEntity>>> execute(
      [CategoryImagesUseCaseInput? input]) {
    return _repository.getCategoryImages(CategoryImagesRequest(
        input!.uid, input.categoryId, input.pageNum, input.order));
  }
}

class CategoryImagesUseCaseInput {
  String uid;
  String categoryId;
  int pageNum;
  String order;

  CategoryImagesUseCaseInput(
      this.uid, this.categoryId, this.pageNum, this.order);
}
