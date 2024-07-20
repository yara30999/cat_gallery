import 'package:flutter/material.dart';
import '../../../resources/values_manager.dart';
import 'widgets/main_breeds_grid_builder_desktop.dart';
import 'widgets/main_breeds_header_desktop.dart';

class MainBreedsBodyDesktop extends StatelessWidget {
  final ScrollController? mainBreedsScreenScrollController;
  const MainBreedsBodyDesktop({
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
            horizontal: AppPadding.p60,
          ),
          sliver: SliverToBoxAdapter(
            child: MainBreedsHeaderDesktop(),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(
            horizontal: AppPadding.p100,
            vertical: AppPadding.p20,
          ),
          sliver: MainBreedsGridBuilderDesktop(),
        ),
      ],
    );
  }
}
