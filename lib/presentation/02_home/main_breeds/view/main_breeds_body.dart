import 'package:flutter/material.dart';
import '../../../resources/values_manager.dart';
import '../../widgets/custom_app_bar.dart';
import 'widgets/main_breeds_grid_builder.dart';
import 'widgets/main_breeds_header.dart';

class MainBreedsBody extends StatelessWidget {
  final ScrollController? mainBreedsScreenScrollController;
  const MainBreedsBody({
    super.key,
    required this.mainBreedsScreenScrollController,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: mainBreedsScreenScrollController,
      slivers: const [
        PersistentAppBar(),
        SliverPadding(
          padding: EdgeInsets.symmetric(
            horizontal: AppPadding.p16,
          ),
          sliver: SliverToBoxAdapter(
            child: MainBreedsHeader(),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(
            horizontal: AppPadding.p16,
            vertical: AppPadding.p20,
          ),
          sliver: MainBreedsGridBuilder(),
        ),
      ],
    );
  }
}
