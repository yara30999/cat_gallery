import '../../app/extensions.dart';
import '../../domain/entities/cat_breed_card.dart';
import '../../domain/entities/cat_image_entity.dart';
import '../../presentation/resources/conistants_manager.dart';
import '../responses/image_response.dart';
import '../responses/breeds_response.dart';

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
