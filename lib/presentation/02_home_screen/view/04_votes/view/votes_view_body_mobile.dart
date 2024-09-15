import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../resources/styles_manager.dart';
import '../../../../resources/values_manager.dart';
import '../../../view_model/scroll_controllers_cubit/scroll_controllers_cubit.dart';
import 'bloc_builders/votes_bloc_consumer.dart';
import 'widgets/votes_header.dart';

class VotesViewBodyMobile extends StatelessWidget {
  const VotesViewBodyMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller:
          context.read<BottomScrollControllersCubit>().bottomScrollController,
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.only(
            right: AppSize.s16,
            left: AppSize.s16,
            top: AppSize.s10,
            bottom: 0,
          ),
          sliver: SliverToBoxAdapter(
            child: VotesScreenHeader(
              headerStyle: Styles.style18Medium(),
            ),
          ),
        ),
        const SliverPadding(
          padding: EdgeInsets.symmetric(
            horizontal: AppPadding.p16,
            vertical: AppPadding.p20,
          ),
          sliver: VotesBlocConsumer(),
        ),
      ],
    );
  }
}
