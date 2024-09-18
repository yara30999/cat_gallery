import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../domain/entities/authentication.dart';
import '../domain/entities/cat_breed_card.dart';
import '../domain/entities/cat_with_click_entity.dart';
import '../domain/entities/image_analysis_entity.dart';
import '../presentation/resources/conistants_manager.dart';
import '../presentation/resources/values_manager.dart';

bool isLightTheme(BuildContext context) {
  return Theme.of(context).brightness == Brightness.light;
}

Future<void> hiveBoxes() async {
  await Hive.openBox<CatBreedCardEntity>(AppConstants.kBreedsBox);
  await Hive.openBox<AuthenticationEntity>(AppConstants.kUserDataBox);
}

void hiveAdapters() {
  Hive.registerAdapter(CatBreedCardEntityAdapter());
  Hive.registerAdapter(AuthenticationEntityAdapter());
}

void showSnakBar(BuildContext context, String msg) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      margin: const EdgeInsets.symmetric(horizontal: AppSize.s15),
      content: Text(
        msg,
      ),
    ),
  );
}

List<CatBreedCardEntity> generateDummyCatBreedsList() {
  return List.generate(40, (index) {
    return CatBreedCardEntity(
      breedId: 'dummy_id',
      breedName: 'Dummy_name',
      referenceImgId: '111111111',
      referenceImgurl: '',
    );
  });
}

List<CatWithClickEntity> generateDummyCatImagesList() {
  return List.generate(40, (index) {
    return CatWithClickEntity(
        imageId: '1111',
        imageUrl: '',
        favorite: const Favourite(id: 1111),
        vote: const Vote(id: 1, value: 3),
        createdAt: DateTime.now(),
        breedName: 'bla bla');
  });
}

ImageAnalysisEntity generateDummyImageAnalysisData() {
  return const ImageAnalysisEntity(labels: [
    Label(name: 'Animal', confidence: 99.23681640625),
    Label(name: 'Mammal', confidence: 99.23681640625),
    Label(name: 'Rat', confidence: 99.23681640625),
    Label(name: 'Cat', confidence: 94.15872192382812),
    Label(name: 'Pet', confidence: 94.15872192382812),
    Label(name: 'Kitten', confidence: 84.81489562988281),
    Label(name: 'Head', confidence: 57.13328552246094),
    Label(name: 'Snout', confidence: 56.83573532104492),
    Label(name: 'Abyssinian', confidence: 55.87989044189453),
    Label(name: 'Face', confidence: 54.641197204589844),
    Label(name: 'Head', confidence: 57.13328552246094),
    Label(name: 'Mammal', confidence: 99.23681640625),
  ], imageId: '0XYvRd7oD');
}
