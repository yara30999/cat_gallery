import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../02_home_screen/view_model/scroll_controllers_cubit/scroll_controllers_cubit.dart';
import '../../resources/values_manager.dart';
import 'bloc_builder/no_breed_bloc_consumer.dart';
import 'widgets/no_breed_header_persistent_mobile.dart';

class NoBreedBodyMobile extends StatelessWidget {
  const NoBreedBodyMobile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller:
          context.read<BottomScrollControllersCubit>().bottomScrollController,
      slivers: const [
        NoBreedHeaderPersistentMobile(),
        SliverPadding(
          padding: EdgeInsets.symmetric(
            horizontal: AppPadding.p16,
            vertical: AppPadding.p20,
          ),
          sliver: NoBreedBlocConsumer(),
        ),
      ],
    );
  }
}
