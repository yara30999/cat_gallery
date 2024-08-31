import 'package:flutter/material.dart';

import '../domain/entities/cat_breed_card.dart';

bool isLightTheme(BuildContext context) {
  return Theme.of(context).brightness == Brightness.light;
}

void showSnakBar(BuildContext context, String msg) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(msg),
  ));
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
