import 'dart:io';

import 'package:dartz/dartz.dart';
import '../../data/network/failure.dart';
import '../../data/network/requests.dart';
import '../repository/repository.dart';
import 'base_usecase.dart';

class UploadImageUsecase implements BaseUseCase<UploadImageUseCaseInput, void> {
  final Repository _repository;

  UploadImageUsecase(this._repository);

  @override
  Future<Either<Failure, void>> execute([UploadImageUseCaseInput? input]) {
    return _repository.uploadedImage(UploadImageRequest(
        input!.imgFile, input.uid, input.breedId, input.categoryId));
  }
}

class UploadImageUseCaseInput {
  File imgFile;
  String uid;
  String? breedId;
  int? categoryId;

  UploadImageUseCaseInput(
    this.imgFile,
    this.uid, [
    this.breedId,
    this.categoryId,
  ]);
}
