import '../../app/extensions.dart';
import '../../domain/entities/cat_breed_card.dart';
import '../../domain/entities/cat_breed_entity.dart' as catBreed;
import '../../domain/entities/cat_image_entity.dart';
import '../../presentation/resources/conistants_manager.dart';
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

extension SingleBreedResponseMapper on SingleBreedResponse? {
  catBreed.CatBreedEntity toDomain() {
    return catBreed.CatBreedEntity(
      id: this!.id,
      name: this!.name,
      weight: catBreed.Weight(
          imperial: this!.weight.imperial, metric: this!.weight.metric),
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
