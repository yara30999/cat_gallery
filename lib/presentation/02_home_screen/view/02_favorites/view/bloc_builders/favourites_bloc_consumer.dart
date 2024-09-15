import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../../../app/functions.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../01_login-register-forgotpass/view_model/auth_cubit/auth_cubit.dart';
import '../../../widgets/states_widgets/empty_state_widget.dart';
import '../../../widgets/states_widgets/error_state_widget.dart';
import '../../view_model/get_favourites_cubit/favourites_cubit.dart';
import '../widgets/favourites_pagination_grid_builder.dart';

class FavouritesBlocConsumer extends StatefulWidget {
  const FavouritesBlocConsumer({super.key});

  @override
  State<FavouritesBlocConsumer> createState() => _FavouritesBlocConsumerState();
}

class _FavouritesBlocConsumerState extends State<FavouritesBlocConsumer> {
  @override
  void initState() {
    var uid = BlocProvider.of<AuthCubit>(context).authObj!.uid;
    BlocProvider.of<FavouritesCubit>(context)
        .getFavourites(uid: uid, pageNum: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavouritesCubit, FavouritesState>(
      listener: (context, state) {
        if (state is FavouritesPaginationFailure) {
          showSnakBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        if (state is FavouritesFailure) {
          return SliverToBoxAdapter(
            child: ErrorStateWidget(
              errorText: state.errMessage,
            ),
          );
        } else if (state is FavouritesSuccessFirstPageEmpty) {
          return SliverToBoxAdapter(
            child: EmptyStateWidget(
              text: S.current.no_favourites_yet,
            ),
          );
        } else {
          return SliverSkeletonizer(
            enabled: state.isLoading,
            child: SliverToBoxAdapter(
              //trigger the request at some points
              child: FavouritesPaginationGridBuilder(
                catImages: state.imageItems,
              ),
            ),
          );
        }
      },
    );
  }
}
