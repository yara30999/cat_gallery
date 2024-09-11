part of 'analysis_cubit.dart';

@immutable
sealed class AnalysisState {
  final ImageAnalysisEntity? analysisData;
  const AnalysisState(this.analysisData);
}

final class AnalysisInitial extends AnalysisState {
  const AnalysisInitial(super.analysisData);
}

class AnalysisLoading extends AnalysisState {
  const AnalysisLoading(super.analysisData);
}

class AnalysisFailure extends AnalysisState {
  final String errMessage;

  const AnalysisFailure(super.analysisData, {required this.errMessage});
}

class AnalysisSuccess extends AnalysisState {
  const AnalysisSuccess(super.analysisData);
}
