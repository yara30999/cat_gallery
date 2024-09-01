import 'package:flutter/material.dart';
import 'specific_breed_grid_builder.dart';
import 'specific_breed_header_desktop.dart';
import '../../../02_home/view/widgets/persistenet_header.dart';
import '../../../resources/values_manager.dart';

class ImagesDesktopBody extends StatelessWidget {
  const ImagesDesktopBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        PersistentHeader(),
        SliverPadding(
          padding:
              EdgeInsets.symmetric(horizontal: AppPadding.p16, vertical: 0),
          sliver: SliverToBoxAdapter(
            child: SpecificBreedHeaderDesktop(),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(
            horizontal: AppPadding.p130, //340
            vertical: AppPadding.p20,
          ),
          sliver: SpecificBreedGridBuilder(),
        ),
      ],
    );
  }
}
