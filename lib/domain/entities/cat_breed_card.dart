import 'package:hive/hive.dart';
part 'cat_breed_card.g.dart';

@HiveType(typeId: 0)
class CatBreedCardEntity {
  @HiveField(0)
  String breedId;
  @HiveField(1)
  String breedName;
  @HiveField(2)
  String referenceImgId;
  @HiveField(3)
  String referenceImgurl;

  CatBreedCardEntity({
    required this.breedId,
    required this.breedName,
    required this.referenceImgId,
    required this.referenceImgurl,
  });

  CatBreedCardEntity copyWith({
    String? breedId,
    String? breedName,
    String? referenceImgId,
    String? referenceImgurl,
  }) =>
      CatBreedCardEntity(
        breedId: breedId ?? this.breedId,
        breedName: breedName ?? this.breedName,
        referenceImgId: referenceImgId ?? this.referenceImgId,
        referenceImgurl: referenceImgurl ?? this.referenceImgurl,
      );
}
