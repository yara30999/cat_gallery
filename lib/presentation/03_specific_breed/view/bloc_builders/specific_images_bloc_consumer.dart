import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../app/functions.dart';
import '../../../../generated/l10n.dart';
import '../../../02_home/view/widgets/states_widgets/empty_state_widget.dart';
import '../../../02_home/view/widgets/states_widgets/error_state_widget.dart';
import '../../view_model/images/specific_images_cubit.dart';
import '../widgets/specific_images_with_pagination_grid_builder.dart';

class SpecificImagesBlocConsumer extends StatelessWidget {
  const SpecificImagesBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SpecificImagesCubit, SpecificImagesState>(
      listener: (context, state) {
        if (state is SpecificImagesPaginationFailure) {
          showSnakBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        if (state is SpecificImagesFailure) {
          return SliverToBoxAdapter(
            child: ErrorStateWidget(
              errorText: state.errMessage,
            ),
          );
        } else if (state is SpecificImagesSuccessFirstPageEmpty) {
          return SliverToBoxAdapter(
            child: EmptyStateWidget(
              text: S.current.no_breed_images,
            ),
          );
        } else {
          return SliverSkeletonizer(
            enabled: state.isLoading,
            child: SliverToBoxAdapter(
              //trigger the request at some points
              child: SpecificImagesWithPaginationGridBuilder(
                catImages: state.imageItems,
              ),
            ),
          );
        }
      },
    );
  }
}
