import 'package:flutter/material.dart';
import '../../02_home_screen/view/widgets/persistenet_header.dart';
import '../../resources/values_manager.dart';
import 'bloc_builders/specific_breed_header_t_bloc_builder.dart';
import 'bloc_builders/specific_images_bloc_consumer.dart';

class SpecificBreedBodyTablet extends StatelessWidget {
  const SpecificBreedBodyTablet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        PersistentHeader(),
        SliverPadding(
          padding:
              EdgeInsets.symmetric(horizontal: AppPadding.p40, vertical: 0),
          sliver: SliverToBoxAdapter(
            child: SpecificBreedHeaderTabletBlocBuilder(),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(
            horizontal: AppPadding.p200,
            vertical: AppPadding.p20,
          ),
          sliver: SpecificImagesBlocConsumer(),
        ),
      ],
    );
  }
}
