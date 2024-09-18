import 'package:flutter/material.dart';
import '../../../resources/language_manager.dart';
import 'category_section.dart';
import 'no_breed_header.dart';
import '../../../02_home_screen/view/widgets/persistenet_header.dart';
import '../../../resources/styles_manager.dart';
import '../../../resources/values_manager.dart';

class NoBreedHeaderPersistentMobile extends StatelessWidget {
  const NoBreedHeaderPersistentMobile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      //floating: true,
      delegate: MySliverPersistentHeaderDelegate(
        minHeight: AppSize.s160,
        maxHeight: AppSize.s160,
        child: Material(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const GoBack(),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppPadding.p16, vertical: 0),
                child: NoBreedHeader(
                  headerStyle: Styles.style18Medium(),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    right: LocalizationUtils.currentLocalIsAr()
                        ? AppPadding.p16
                        : 0.0,
                    left: LocalizationUtils.currentLocalIsAr()
                        ? 0.0
                        : AppPadding.p16),
                child: const CategorySection(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
