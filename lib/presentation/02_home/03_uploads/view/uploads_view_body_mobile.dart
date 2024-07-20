import 'package:flutter/material.dart';
import '../../../resources/values_manager.dart';
import 'widgets/uploads_grid_builder.dart';
import 'widgets/uploads_header_mobile.dart';

class UploadsViewBodyMobile extends StatelessWidget {
  final ScrollController? uploadsScreenScrollController;
  const UploadsViewBodyMobile(
      {super.key, required this.uploadsScreenScrollController});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: uploadsScreenScrollController,
      slivers: const [
        SliverPadding(
          padding: EdgeInsets.only(
            right: AppSize.s16,
            left: AppSize.s16,
            top: AppSize.s10,
            bottom: 0,
          ),
          sliver: SliverToBoxAdapter(
            child: UploadsScreenHeaderMobile(),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(
            horizontal: AppPadding.p16,
            vertical: AppPadding.p20,
          ),
          sliver: UploadsScreenGridBuilder(),
        ),
      ],
    );
  }
}
