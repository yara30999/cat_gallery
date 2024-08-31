import 'package:flutter/material.dart';
import '../../../../resources/styles_manager.dart';
import '../../../../resources/values_manager.dart';
import 'widgets/uploads_grid_builder.dart';
import 'widgets/uploads_header.dart';

class UploadsViewBodyDesktop extends StatelessWidget {
  final ScrollController? uploadsScreenScrollController;
  const UploadsViewBodyDesktop(
      {super.key, required this.uploadsScreenScrollController});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: uploadsScreenScrollController,
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.only(
            right: AppSize.s60,
            left: AppSize.s60,
            top: AppSize.s10,
            bottom: 0,
          ),
          sliver: SliverToBoxAdapter(
            child: UploadsScreenHeader(
              headerStyle: Styles.style36Medium(),
            ),
          ),
        ),
        const SliverPadding(
          padding: EdgeInsets.symmetric(
            horizontal: AppPadding.p340,
            vertical: AppPadding.p20,
          ),
          sliver: UploadsScreenGridBuilder(),
        ),
      ],
    );
  }
}
