import 'package:flutter/material.dart';
import '../../02_home/widgets/custom_app_bar.dart';
import '../../resources/values_manager.dart';
import 'widgets/specific_breed_grid_builder.dart';
import 'widgets/specific_breed_header.dart';

class SpecificBreedBody extends StatefulWidget {
  final ScrollController? specificBreedScreenScrollController;
  const SpecificBreedBody({
    super.key,
    required this.specificBreedScreenScrollController,
  });

  @override
  State<SpecificBreedBody> createState() => _SpecificBreedBodyState();
}

class _SpecificBreedBodyState extends State<SpecificBreedBody> {
  @override
  void dispose() {
    widget.specificBreedScreenScrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: widget.specificBreedScreenScrollController,
      slivers: const [
        PersistentAppBar(),
        SliverPadding(
          padding: EdgeInsets.symmetric(
              horizontal: AppPadding.p16, vertical: AppPadding.p10),
          sliver: SliverToBoxAdapter(
            child: SpecificBreedHeader(),
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
