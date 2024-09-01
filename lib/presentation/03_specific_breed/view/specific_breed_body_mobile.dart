import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../02_home/view/widgets/persistenet_header.dart';
import '../../02_home/view_model/scroll_controllers_cubit/scroll_controllers_cubit.dart';
import '../../resources/values_manager.dart';
import 'widgets/specific_breed_grid_builder.dart';
import 'widgets/specific_breed_header_mobile.dart';

class SpecificBreedBodyMobile extends StatelessWidget {
  const SpecificBreedBodyMobile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller:
          context.read<BottomScrollControllersCubit>().bottomScrollController,
      slivers: const [
        PersistentHeader(),
        SliverPadding(
          padding:
              EdgeInsets.symmetric(horizontal: AppPadding.p16, vertical: 0),
          sliver: SliverToBoxAdapter(
            child: SpecificBreedHeaderMobile(),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(
            horizontal: AppPadding.p16,
            vertical: AppPadding.p20,
          ),
          sliver: SpecificBreedGridBuilder(),
        ),
      ],
    );
  }
}
