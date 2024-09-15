import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../02_home/view_model/settings_cubit/settings_cubit.dart';
import '../../resources/platform_manager.dart';
import '../view_model/cubit/analysis_cubit.dart';
import 'analysis_body_desktop.dart';
import 'analysis_body_mobile.dart';
import 'analysis_body_tablet.dart';

class AnalysisBody extends StatelessWidget {
  const AnalysisBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<SettingsCubit, SettingsState>(
      listener: (context, state) {
        if (state is LocaleSuccess) {
          BlocProvider.of<AnalysisCubit>(context).getImageAnalysis();
        }
      },
      child: MiniAdaptiveLayout(
        mobileLayout: (context) => const AnalysisBodyMobile(),
        tabletLayout: (context) => const AnalysisBodyTablet(),
        desktopLayout: (context) => const AnalysisBodyDesktop(),
      ),
    );
  }
}
