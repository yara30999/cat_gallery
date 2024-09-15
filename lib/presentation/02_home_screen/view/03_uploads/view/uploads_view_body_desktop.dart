import 'package:flutter/material.dart';
import '../../../../resources/styles_manager.dart';
import '../../../../resources/values_manager.dart';
import 'bloc_builder/uploads_bloc_consumer.dart';
import 'widgets/uploads_header.dart';

class UploadsViewBodyDesktop extends StatelessWidget {
  const UploadsViewBodyDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
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
          sliver: UploadsBlocConsumer(),
        ),
      ],
    );
  }
}
