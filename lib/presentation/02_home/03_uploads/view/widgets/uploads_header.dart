import 'package:flutter/material.dart';
import '../../../../../generated/l10n.dart';
import '../../../../resources/color_manager.dart';
import '../../../../resources/routes_manager.dart';

class UploadsScreenHeader extends StatelessWidget {
  const UploadsScreenHeader({super.key, required this.headerStyle});
  final TextStyle headerStyle;

  void _addImageButtonOnPress(BuildContext context) {
    Navigator.pushNamed(context, Routes.addImageRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          S.current.Uploads,
          style: headerStyle,
        ),
        CircleAvatar(
          backgroundColor: Theme.of(context).unselectedWidgetColor,
          child: IconButton(
              color: ColorManager.black,
              onPressed: () {
                _addImageButtonOnPress(context);
              },
              icon: const Icon(Icons.add_photo_alternate_outlined)),
        ),
      ],
    );
  }
}
