import 'package:flutter/material.dart';
import '../../../resources/values_manager.dart';
import '../../widgets/custom_app_bar.dart';
import 'widgets/votes_grid_builder.dart';
import 'widgets/votes_header.dart';

class VotesViewBody extends StatelessWidget {
  final ScrollController? votesScreenScrollController;
  const VotesViewBody({super.key, required this.votesScreenScrollController});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: votesScreenScrollController,
      slivers: const [
        PersistentAppBar(),
        SliverPadding(
          padding: EdgeInsets.only(
            right: AppSize.s16,
            left: AppSize.s16,
            top: AppSize.s10,
            bottom: 0,
          ),
          sliver: SliverToBoxAdapter(
            child: VotesScreenHeader(),
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
