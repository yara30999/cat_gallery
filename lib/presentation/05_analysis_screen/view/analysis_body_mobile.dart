import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../02_home/view/widgets/persistenet_header.dart';
import '../../02_home/view_model/scroll_controllers_cubit/scroll_controllers_cubit.dart';
import '../../resources/styles_manager.dart';
import '../../resources/values_manager.dart';
import 'widgets/analysis_header.dart';
import 'widgets/analysis_section_mobile.dart';

class AnalysisBodyMobile extends StatelessWidget {
  const AnalysisBodyMobile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller:
          context.read<BottomScrollControllersCubit>().bottomScrollController,
      slivers: [
        const PersistentHeader(),
        SliverPadding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppPadding.p16, vertical: 0),
          sliver: SliverToBoxAdapter(
            child: AnalysisHeader(
              firstStyle: Styles.style18Medium(),
              secondStyle: Styles.style14Medium(),
            ),
          ),
        ),
        const SliverPadding(
          padding: EdgeInsets.symmetric(
            horizontal: AppPadding.p16,
            vertical: AppPadding.p20,
          ),
          sliver: SliverToBoxAdapter(
            child: AnalysisSectionMobile(),
          ),
        ),
      ],
    );
  }
}
