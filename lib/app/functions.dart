import 'package:flutter/material.dart';
import '../domain/entities/cat_breed_card.dart';
import '../domain/entities/cat_with_click_entity.dart';
import '../presentation/resources/values_manager.dart';

bool isLightTheme(BuildContext context) {
  return Theme.of(context).brightness == Brightness.light;
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
