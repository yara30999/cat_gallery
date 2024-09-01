import 'package:flutter/material.dart';
import 'bloc_builders/specific_breed_info_d_bloc_builder.dart';
import 'widgets/images_desktop_body.dart';

class SpecificBreedBodyDesktop extends StatelessWidget {
  const SpecificBreedBodyDesktop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          flex: 8,
          fit: FlexFit.loose,
          child: ImagesDesktopBody(),
        ),
        Flexible(
          flex: 3,
          fit: FlexFit.loose,
          child: SpecificBreedInfoDesktopBlocBuilder(),
        ),
      ],
    );
  }
}
