import 'package:flutter/material.dart';
import '../../../resources/styles_manager.dart';
import '../../../resources/values_manager.dart';
import 'widgets/votes_grid_builder.dart';
import 'widgets/votes_header.dart';

class VotesViewBodyDesktop extends StatelessWidget {
  final ScrollController? votesScreenScrollController;
  const VotesViewBodyDesktop(
      {super.key, required this.votesScreenScrollController});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: votesScreenScrollController,
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.only(
            right: AppSize.s60,
            left: AppSize.s60,
            top: AppSize.s10,
            bottom: 0,
          ),
          sliver: SliverToBoxAdapter(
            child: VotesScreenHeader(
              headerStyle: Styles.style36Medium(),
            ),
          ),
        ),
        const SliverPadding(
          padding: EdgeInsets.symmetric(
            horizontal: AppPadding.p340,
            vertical: AppPadding.p20,
          ),
          sliver: VotesGridBuilder(),
        ),
      ],
    );
  }
}
