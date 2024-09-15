import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../resources/styles_manager.dart';
import '../../../../resources/values_manager.dart';
import '../../../view_model/scroll_controllers_cubit/scroll_controllers_cubit.dart';
import 'bloc_builders/main_breeds_bloc_builder.dart';
import 'widgets/main_breeds_header.dart';

class MainBreedsBodyMobile extends StatelessWidget {
  const MainBreedsBodyMobile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller:
          context.read<BottomScrollControllersCubit>().bottomScrollController,
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.p16,
          ),
          sliver: SliverToBoxAdapter(
            child: MainBreedsHeader(
              headerStyle: Styles.style18Medium(),
            ),
          ),
        ),
        const SliverPadding(
          padding: EdgeInsets.symmetric(
            horizontal: AppPadding.p16,
            vertical: AppPadding.p20,
          ),
          sliver: MainBreedsBlocBuilder(
            columnNum: 2,
          ),
        ),
      ],
    );
  }
}
