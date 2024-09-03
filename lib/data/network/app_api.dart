import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../presentation/resources/conistants_manager.dart';
import '../responses/cat_with_click_response.dart';
import '../responses/image_response.dart';
import '../responses/breeds_response.dart';
import '../responses/single_breed_response.dart';
part 'app_api.g.dart';

@RestApi(baseUrl: AppConstants.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @GET("v1/breeds?limit=100")
  Future<List<BreedResponse>> getBreeds(
    @Query('sub_id') String uid,
  );

  @GET("v1/images/{imgid}")
  Future<CatImageResponse> getImage(
    @Query('sub_id') String uid,
    @Path('imgid') String imgid,
  );

  @GET("v1/breeds/{breed_id}")
  Future<SingleBreedResponse> getBreedInfo(
    @Query('sub_id') String uid,
    @Path('breed_id') String breedId,
  );

  @GET(
      "v1/images/search?order=ASC&limit=20&include_breeds=0&include_categories=1")
  Future<List<CatWithClickResponse>> getBreedImages(
    @Query('sub_id') String uid,
    @Query('breed_ids') String breedId,
    @Query('page') int pageNum,
  );
}
