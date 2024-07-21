import 'package:flutter/material.dart';
import '../../../resources/styles_manager.dart';
import '../../../resources/values_manager.dart';
import 'widgets/main_breeds_grid_builder.dart';
import 'widgets/main_breeds_header.dart';

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
          sliver: MainBreedsGridBuilder(
            columnNumbers: 2,
          ),
        ),
      ],
    );
  }
}
