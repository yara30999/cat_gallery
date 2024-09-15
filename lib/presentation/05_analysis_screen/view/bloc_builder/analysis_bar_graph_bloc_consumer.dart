import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../app/functions.dart';
import '../../../02_home_screen/view/widgets/states_widgets/analysis_state_widget.dart';
import '../../../02_home_screen/view/widgets/states_widgets/error_state_widget.dart';
import '../../../resources/styles_manager.dart';
import '../../view_model/cubit/analysis_cubit.dart';
import '../widgets/analysis_bar_graph.dart';

class AnalysisBarGraphBlocConsumer extends StatelessWidget {
  final double? barWidth;
  const AnalysisBarGraphBlocConsumer({super.key, this.barWidth});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AnalysisCubit, AnalysisState>(
      listener: (context, state) {
        if (state is AnalysisFailure) {
          showSnakBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        if (state is AnalysisFailure) {
          return ErrorStateWidget(
            errorText: state.errMessage,
          );
        } else if (state is AnalysisLoading) {
          return const AnalysisStateWidget();
        } else {
          return AnalysisBarGraph(
            imageAnalysisEntity: state.analysisData!,
            labelsStyle: Styles.style14Medium(),
            barWidth: barWidth,
          );
        }
      },
    );
  }
}
