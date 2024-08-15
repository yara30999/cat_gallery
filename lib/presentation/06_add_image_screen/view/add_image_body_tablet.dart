import 'package:flutter/material.dart';
import '../../02_home/widgets/persistenet_header.dart';
import '../../resources/styles_manager.dart';
import '../../resources/values_manager.dart';
import 'widgets/add_image_header.dart';
import 'widgets/add_image_secion_tablet.dart';

class AddImageBodyTablet extends StatelessWidget {
  final ScrollController? addImageScreenScrollController;
  const AddImageBodyTablet({super.key, this.addImageScreenScrollController});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: addImageScreenScrollController,
      slivers: [
        const PersistentHeader(),
        SliverPadding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppPadding.p40, vertical: 0),
          sliver: SliverToBoxAdapter(
            child: AddImageHeader(
              firstStyle: Styles.style22Medium(),
              secondStyle: Styles.style16Regular(),
            ),
          ),
        ),
        const SliverPadding(
          padding: EdgeInsets.symmetric(
            horizontal: AppPadding.p16,
            vertical: AppPadding.p20,
          ),
          sliver: SliverToBoxAdapter(
            child: AddImageSectionTablet(),
          ),
        ),
      ],
    );
  }
}
