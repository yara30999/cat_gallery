import 'package:flutter/material.dart';
import '../../../resources/values_manager.dart';
import 'widgets/main_breeds_grid_builder_tablet.dart';
import 'widgets/main_breeds_header_tablet.dart';

class MainBreedsBodyTablet extends StatelessWidget {
  final ScrollController? mainBreedsScreenScrollController;
  const MainBreedsBodyTablet({
    super.key,
    required this.mainBreedsScreenScrollController,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: mainBreedsScreenScrollController,
      slivers: const [
        SliverPadding(
          padding: EdgeInsets.symmetric(
            horizontal: AppPadding.p20,
          ),
          sliver: SliverToBoxAdapter(
            child: MainBreedsHeaderTablet(),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(
            horizontal: AppPadding.p60,
            vertical: AppPadding.p20,
          ),
          sliver: MainBreedsGridBuilderTablet(),
        ),
      ],
    );
  }
}
