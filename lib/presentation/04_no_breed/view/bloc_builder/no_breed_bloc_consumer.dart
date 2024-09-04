import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../app/functions.dart';
import '../../../../generated/l10n.dart';
import '../../../01_login-register-forgotpass/view_model/auth_cubit/auth_cubit.dart';
import '../../../02_home/view/widgets/states_widgets/empty_state_widget.dart';
import '../../../02_home/view/widgets/states_widgets/error_state_widget.dart';
import '../../view_model/bloc/no_breed_bloc.dart';
import '../widgets/no_breed_pagination_grid_builder.dart';

class NoBreedBlocConsumer extends StatefulWidget {
  const NoBreedBlocConsumer({super.key});

  @override
  State<NoBreedBlocConsumer> createState() => _NoBreedBlocConsumerState();
}

class _NoBreedBlocConsumerState extends State<NoBreedBlocConsumer> {
  @override
  void initState() {
    var uid = BlocProvider.of<AuthCubit>(context).authObj!.uid;
    BlocProvider.of<NoBreedBloc>(context)
        .add(CategoryImagesEvent(uid: uid, pageNum: 0));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NoBreedBloc, NoBreedState>(
      listener: (context, state) {
        if (state is NoBreedPaginationFailure) {
          showSnakBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        if (state is NoBreedFailure) {
          return SliverToBoxAdapter(
            child: ErrorStateWidget(
              errorText: state.errMessage,
            ),
          );
        } else if (state is NoBreedSuccessFirstPageEmpty) {
          return SliverToBoxAdapter(
            child: EmptyStateWidget(
              text: S.current.no_images_category,
            ),
          );
        } else {
          return SliverSkeletonizer(
            enabled: state.isLoading,
            child: SliverToBoxAdapter(
              //trigger the request at some points
              child: NoBreedPaginationGridBuilder(
                catImages: state.imageItems,
              ),
            ),
          );
        }
      },
    );
  }
}
