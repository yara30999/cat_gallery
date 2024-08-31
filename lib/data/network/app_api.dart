import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../presentation/resources/conistants_manager.dart';
import '../responses/image_response.dart';
import '../responses/breeds_response.dart';
part 'app_api.g.dart';

// var userId= BlocProvider.of<AuthCubit>(context).authObj!.name;

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
}
