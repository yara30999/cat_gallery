import 'package:flutter/material.dart';
import '../../02_home/view/widgets/persistenet_header.dart';
import '../../resources/values_manager.dart';
import 'widgets/specific_breed_grid_builder.dart';
import 'widgets/specific_breed_header_mobile.dart';

class SpecificBreedBodyMobile extends StatelessWidget {
  final ScrollController? specificBreedScreenScrollController;
  const SpecificBreedBodyMobile({
    super.key,
    required this.specificBreedScreenScrollController,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: specificBreedScreenScrollController,
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
