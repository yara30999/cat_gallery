import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../../app/functions.dart';
import '../../../../domain/entities/image_analysis_entity.dart';
import '../../../../domain/usecase/get_image_analysis_usecase.dart';

part 'analysis_state.dart';

class AnalysisCubit extends Cubit<AnalysisState> {
  final GetImageAnalysisUsecase _getImageAnalysisUsecase;
  String imgUrl = '';
  late ImageAnalysisEntity analysisData;
  AnalysisCubit(this._getImageAnalysisUsecase)
      : super(const AnalysisInitial(null)) {
    // Initialize catBreedsList in the constructor body
    analysisData = generateDummyImageAnalysisData();
  }

  Future<void> getImageAnalysis(
      {required String uid, required String imgId}) async {
    emit(AnalysisLoading(analysisData));
    var result = await _getImageAnalysisUsecase
        .execute(ImageAnalysisUseCaseInput(uid, imgId));
    result.fold((failure) async {
      var errMessage =
          '${failure.message.toString()} ${failure.code.toString()}';
      emit(AnalysisFailure(analysisData, errMessage: errMessage));
    }, (imgSuccess) async {
      analysisData = imgSuccess;
      emit(AnalysisSuccess(analysisData));
    });
  }
}
