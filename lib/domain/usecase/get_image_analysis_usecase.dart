import 'package:dartz/dartz.dart';
import '../../data/network/failure.dart';
import '../../data/network/requests.dart';
import '../entities/image_analysis_entity.dart';
import '../repository/repository.dart';
import 'base_usecase.dart';

class GetImageAnalysisUsecase
    implements BaseUseCase<ImageAnalysisUseCaseInput, ImageAnalysisEntity> {
  final Repository _repository;

  GetImageAnalysisUsecase(this._repository);

  @override
  Future<Either<Failure, ImageAnalysisEntity>> execute(
      [ImageAnalysisUseCaseInput? input]) {
    return _repository
        .getImageAnalysis(GetImageAnalysisRequest(input!.uid, input.imgId));
  }
}

class ImageAnalysisUseCaseInput {
  String uid;
  String imgId;

  ImageAnalysisUseCaseInput(this.uid, this.imgId);
}
