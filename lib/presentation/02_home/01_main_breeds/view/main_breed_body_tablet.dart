import 'package:flutter/material.dart';
import '../../../resources/styles_manager.dart';
import '../../../resources/values_manager.dart';
import 'widgets/main_breeds_grid_builder_tablet.dart';
import 'widgets/main_breeds_header.dart';

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
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.p20,
          ),
          sliver: SliverToBoxAdapter(
            child: MainBreedsHeader(
              headerStyle: Styles.style22Medium(),
            ),
          ),
        ),
        const SliverPadding(
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
