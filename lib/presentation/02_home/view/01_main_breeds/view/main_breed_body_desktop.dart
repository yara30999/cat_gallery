import 'package:flutter/material.dart';
import '../../../../resources/styles_manager.dart';
import '../../../../resources/values_manager.dart';
import 'widgets/main_breeds_bloc_builder.dart';
import 'widgets/main_breeds_header.dart';

class MainBreedsBodyDesktop extends StatelessWidget {
  const MainBreedsBodyDesktop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
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
          sliver: MainBreedsBlocBuilder(
            columnNum: 6,
          ),
        ),
      ],
    );
  }
}
