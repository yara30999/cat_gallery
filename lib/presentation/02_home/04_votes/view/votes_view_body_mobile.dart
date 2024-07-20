import 'package:flutter/material.dart';
import '../../../resources/values_manager.dart';
import 'widgets/votes_grid_builder.dart';
import 'widgets/votes_header_mobile.dart';

class VotesViewBodyMobile extends StatelessWidget {
  final ScrollController? votesScreenScrollController;
  const VotesViewBodyMobile(
      {super.key, required this.votesScreenScrollController});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: votesScreenScrollController,
      slivers: const [
        SliverPadding(
          padding: EdgeInsets.only(
            right: AppSize.s16,
            left: AppSize.s16,
            top: AppSize.s10,
            bottom: 0,
          ),
          sliver: SliverToBoxAdapter(
            child: VotesScreenHeaderMobile(),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(
            horizontal: AppPadding.p16,
            vertical: AppPadding.p20,
          ),
          sliver: VotesGridBuilder(),
        ),
      ],
    );
  }
}
