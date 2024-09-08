import 'package:dartz/dartz.dart';
import '../../data/network/failure.dart';
import '../../data/network/requests.dart';
import '../repository/repository.dart';
import 'base_usecase.dart';

class DeleteUploadedImageUsecase
    implements BaseUseCase<DeleteUploadedImageUseCaseInput, void> {
  final Repository _repository;

  DeleteUploadedImageUsecase(this._repository);

  @override
  Future<Either<Failure, void>> execute(
      [DeleteUploadedImageUseCaseInput? input]) {
    return _repository
        .deleteUploadedImage(DeleteImageRequest(input!.uid, input.imgId));
  }
}

class DeleteUploadedImageUseCaseInput {
  String uid;
  String imgId;

  DeleteUploadedImageUseCaseInput(this.uid, this.imgId);
}
