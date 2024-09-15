import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../../../app/functions.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../01_login-register-forgotpass/view_model/auth_cubit/auth_cubit.dart';
import '../../../widgets/states_widgets/empty_state_widget.dart';
import '../../../widgets/states_widgets/error_state_widget.dart';
import '../../view_model/get_votes_cubit/votes_cubit.dart';
import '../widgets/votes_pagination_grid_builder.dart';

class VotesBlocConsumer extends StatefulWidget {
  const VotesBlocConsumer({super.key});

  @override
  State<VotesBlocConsumer> createState() => _VotesBlocConsumerState();
}

class _VotesBlocConsumerState extends State<VotesBlocConsumer> {
  @override
  void initState() {
    var uid = BlocProvider.of<AuthCubit>(context).authObj!.uid;
    BlocProvider.of<VotesCubit>(context).getVotes(uid: uid, pageNum: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VotesCubit, VotesState>(
      listener: (context, state) {
        if (state is VotesPaginationFailure) {
          showSnakBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        if (state is VotesFailure) {
          return SliverToBoxAdapter(
            child: ErrorStateWidget(
              errorText: state.errMessage,
            ),
          );
        } else if (state is VotesSuccessFirstPageEmpty) {
          return SliverToBoxAdapter(
            child: EmptyStateWidget(
              text: S.current.no_votes_yet,
            ),
          );
        } else {
          return SliverSkeletonizer(
            enabled: state.isLoading,
            child: SliverToBoxAdapter(
              //trigger the request at some points
              child: VotesPaginationGridBuilder(
                catImages: state.imageItems,
              ),
            ),
          );
        }
      },
    );
  }
}
