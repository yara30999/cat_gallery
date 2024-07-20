import 'package:flutter/material.dart';
import '../../../../../generated/l10n.dart';
import '../../../../resources/color_manager.dart';
import '../../../../resources/styles_manager.dart';

class UploadsScreenHeaderTablet extends StatelessWidget {
  const UploadsScreenHeaderTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          S.current.Uploads,
          style: Styles.style22Medium(),
        ),
        CircleAvatar(
          backgroundColor: Theme.of(context).unselectedWidgetColor,
          child: IconButton(
              color: ColorManager.black,
              onPressed: () {},
              icon: const Icon(Icons.add_photo_alternate_outlined)),
        ),
      ],
    );
  }
}
