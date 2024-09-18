import 'package:flutter/material.dart';
import '../../resources/values_manager.dart';
import 'bloc_builder/no_breed_bloc_consumer.dart';
import 'widgets/no_breed_header_persistent_tablet.dart';

class NoBreedBodyTablet extends StatelessWidget {
  const NoBreedBodyTablet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        NoBreedHeaderPersistentTablet(),
        SliverPadding(
          padding: EdgeInsets.symmetric(
            horizontal: AppPadding.p200,
            vertical: AppPadding.p20,
          ),
          sliver: NoBreedBlocConsumer(),
        ),
      ],
    );
  }
}
