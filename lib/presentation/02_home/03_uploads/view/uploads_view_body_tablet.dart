import 'package:flutter/material.dart';
import '../../../resources/styles_manager.dart';
import '../../../resources/values_manager.dart';
import 'widgets/uploads_grid_builder.dart';
import 'widgets/uploads_header.dart';

class UploadsViewBodyTablet extends StatelessWidget {
  final ScrollController? uploadsScreenScrollController;
  const UploadsViewBodyTablet(
      {super.key, required this.uploadsScreenScrollController});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: uploadsScreenScrollController,
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.only(
            right: AppSize.s40,
            left: AppSize.s40,
            top: AppSize.s10,
            bottom: 0,
          ),
          sliver: SliverToBoxAdapter(
            child: UploadsScreenHeader(
              headerStyle: Styles.style22Medium(),
            ),
          ),
        ),
        const SliverPadding(
          padding: EdgeInsets.symmetric(
            horizontal: AppPadding.p200,
            vertical: AppPadding.p20,
          ),
          sliver: UploadsScreenGridBuilder(),
        ),
      ],
    );
  }
}
