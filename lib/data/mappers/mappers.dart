import '../../app/extensions.dart';
import '../../domain/entities/cat_breed_card.dart';
import '../../domain/entities/cat_breed_entity.dart' as cat_breed;
import '../../domain/entities/cat_image_entity.dart';
import '../../domain/entities/cat_with_click_entity.dart';
import '../../presentation/resources/conistants_manager.dart';
import '../responses/cat_with_click_response.dart';
import '../responses/image_response.dart';
import '../responses/breeds_response.dart';
import '../responses/single_breed_response.dart';

extension BreedResponseMapper on BreedResponse? {
  CatBreedCardEntity toDomain() {
    var imgid = this?.referenceImageId?.orEmpty() ?? AppConstants.empty;
    String url;
    if (imgid == '4RzEwvyzz' || imgid == 'O3btzLlsO' || imgid == 'DbwiefiaY') {
      url = 'https://cdn2.thecatapi.com/images/$imgid.png';
    } else if (imgid == '') {
      url = '';
    } else {
      url = 'https://cdn2.thecatapi.com/images/$imgid.jpg';
    }
    return CatBreedCardEntity(
      breedId: this!.id,
      breedName: this!.name,
      referenceImgId: imgid,
      referenceImgurl: url,
    );
  }
}

extension CatImageResponseMapper on CatImageResponse? {
  CatImageEntity toDomain() {
    return CatImageEntity(
      imgid: this!.id,
      url: this!.url,
      width: this!.width,
      height: this!.height,
    );
  }
}

extension WeightResponseMapper on WeightResponse? {
  cat_breed.Weight toDomain() {
    return cat_breed.Weight(
      imperial: this!.imperial,
      metric: this!.metric,
    );
  }
}

extension SingleBreedResponseMapper on SingleBreedResponse? {
  cat_breed.CatBreedEntity toDomain() {
    return cat_breed.CatBreedEntity(
      id: this!.id,
      name: this!.name,
      weight: this!.weight.toDomain(),
      origin: this!.origin,
      description: this!.description,
      lifeSpan: this!.lifeSpan,
      temperament: this!.temperament,
      referenceImageId: this?.referenceImageId.orEmpty() ?? AppConstants.empty,
      vetstreetUrl: this?.vetstreetUrl.orEmpty() ?? AppConstants.empty,
      wikipediaUrl: this?.wikipediaUrl.orEmpty() ?? AppConstants.empty,
      adaptability: this!.adaptability,
      affectionLevel: this!.affectionLevel,
      childFriendly: this!.childFriendly,
      dogFriendly: this!.dogFriendly,
      energyLevel: this!.energyLevel,
      grooming: this!.grooming,
      healthIssues: this!.healthIssues,
      intelligence: this!.intelligence,
      sheddingLevel: this!.sheddingLevel,
      socialNeeds: this!.socialNeeds,
      strangerFriendly: this!.strangerFriendly,
    );
  }
}

extension FavouriteResponseMapper on FavouriteResponse? {
  Favorite? toDomain() {
    return Favorite(
      id: this!.id,
    );
  }
}

extension VoteResponseMapper on VoteResponse? {
  Vote? toDomain() {
    return Vote(id: this!.id, value: this!.value);
  }
}

extension CategoryResponseMapper on CategoryResponse? {
  Category? toDomain() {
    return Category(
      id: this!.id,
      name: this!.name,
    );
  }
}

extension CatWithClickResponseMapper on CatWithClickResponse? {
  CatWithClickEntity toDomain() {
    List<Category>? categories =
        (this?.categories?.map((categoryRes) => categoryRes.toDomain()) ??
                const Iterable.empty())
            .cast<Category>()
            .toList();

    List<CatBreedCardEntity> breedsList =
        (this?.breeds?.map((breedsRes) => breedsRes.toDomain()) ??
                const Iterable.empty())
            .cast<CatBreedCardEntity>()
            .toList();

    String? breedName = breedsList.isEmpty ? null : breedsList.first.breedName;

    return CatWithClickEntity(
        imageId: this!.id,
        imageUrl: this!.url,
        favorite: this?.favourite?.toDomain(),
        vote: this?.vote?.toDomain(),
        createdAt: this?.createdAt,
        categories: categories,
        breedName: breedName);
  }
}
