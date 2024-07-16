// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';
import '../../02_home/widgets/custom_app_bar.dart';
import '../../03_specific_breed/view/widgets/specific_breed_header.dart';
import '../../resources/styles_manager.dart';
import '../../resources/values_manager.dart';

class AnalysisBody extends StatelessWidget {
  final ScrollController? analysisScreenScrollController;
  const AnalysisBody({
    super.key,
    required this.analysisScreenScrollController,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: analysisScreenScrollController,
      slivers: const [
        PersistentAppBar(),
        SliverPadding(
          padding: EdgeInsets.symmetric(
              horizontal: AppPadding.p16, vertical: AppPadding.p10),
          sliver: SliverToBoxAdapter(
            child: AnalysisHeader(),
          ),
        ),
        // SliverPadding(
        //   padding: EdgeInsets.symmetric(
        //     horizontal: AppPadding.p16,
        //     vertical: AppPadding.p20,
        //   ),
        //   sliver: SpecificBreedGridBuilder(),
        // ),
      ],
    );
  }
}

class AnalysisHeader extends StatelessWidget {
  const AnalysisHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            S.current.image_analysis,
            style: Styles.style36Medium(),
          ),
        ),
        // SpecificBreedInformation(
        //   catBreedEntity: dummyCatBreed,
        // ),
        // SpecificBreedBarGraph(
        //   catBreedEntity: dummyCatBreed,
        // ),
      ],
    );
  }
}
