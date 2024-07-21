import 'package:flutter/material.dart';
import '../../../resources/styles_manager.dart';
import '../../../resources/values_manager.dart';
import 'widgets/main_breeds_grid_builder.dart';
import 'widgets/main_breeds_header.dart';

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
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.p60,
          ),
          sliver: SliverToBoxAdapter(
            child: MainBreedsHeader(
              headerStyle: Styles.style36Medium(),
            ),
          ),
        ),
        const SliverPadding(
          padding: EdgeInsets.symmetric(
            horizontal: AppPadding.p100,
            vertical: AppPadding.p20,
          ),
          sliver: MainBreedsGridBuilder(
            columnNumbers: 6,
          ),
        ),
      ],
    );
  }
}
