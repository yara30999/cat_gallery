import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../presentation/resources/conistants_manager.dart';
import '../request_body/vote_body.dart';
import '../responses/cat_with_click_response.dart';
import '../responses/get_votes_response.dart';
import '../responses/image_response.dart';
import '../responses/breeds_response.dart';
import '../responses/single_breed_response.dart';
import '../responses/vote_single_image_response.dart';
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

  @GET(
      "v1/images/search?mime_types=jpg&limit=30&include_breeds=0&include_categories=1")
  Future<List<CatWithClickResponse>> getNoCategoryImages(
    @Query('sub_id') String uid,
    @Query('page') int pageNum,
    @Query('order') String order,
  );

  @GET(
      "v1/images/search?mime_types=jpg&limit=30&include_breeds=0&include_categories=1")
  Future<List<CatWithClickResponse>> getCategoryImages(
    @Query('sub_id') String uid,
    @Query('category_ids') String categoryId,
    @Query('page') int pageNum,
    @Query('order') String order,
  );

  @GET("v1/votes?limit=100&order=DESC")
  Future<List<VotesResponse>> getVotes(
    @Query('sub_id') String uid,
    @Query('page') int pageNum,
  );

  @POST("v1/votes")
  Future<VoteSingleImageResponse> postVote(@Body() VoteBody voteBody);
}
