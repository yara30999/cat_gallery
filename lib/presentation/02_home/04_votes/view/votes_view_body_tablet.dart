import 'package:flutter/material.dart';
import '../../../resources/values_manager.dart';
import 'widgets/votes_grid_builder.dart';
import 'widgets/votes_header_tablet.dart';

class VotesViewBodyTablet extends StatelessWidget {
  final ScrollController? votesScreenScrollController;
  const VotesViewBodyTablet(
      {super.key, required this.votesScreenScrollController});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: votesScreenScrollController,
      slivers: const [
        SliverPadding(
          padding: EdgeInsets.only(
            right: AppSize.s40,
            left: AppSize.s40,
            top: AppSize.s10,
            bottom: 0,
          ),
          sliver: SliverToBoxAdapter(
            child: VotesScreenHeaderTablet(),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(
            horizontal: AppPadding.p100,
            vertical: AppPadding.p20,
          ),
          sliver: VotesGridBuilder(),
        ),
      ],
    );
  }
}
