import 'package:flutter/material.dart';
import '../../../resources/values_manager.dart';
import 'widgets/main_breeds_grid_builder_mobile.dart';
import 'widgets/main_breeds_header_mobile.dart';

class MainBreedsBodyMobile extends StatelessWidget {
  final ScrollController? mainBreedsScreenScrollController;
  const MainBreedsBodyMobile({
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
            horizontal: AppPadding.p16,
          ),
          sliver: SliverToBoxAdapter(
            child: MainBreedsHeaderMobile(),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(
            horizontal: AppPadding.p16,
            vertical: AppPadding.p20,
          ),
          sliver: MainBreedsGridBuilderMobile(),
        ),
      ],
    );
  }
}
