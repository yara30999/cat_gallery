import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../generated/l10n.dart';
import '../../../02_home/view_model/settings_cubit/settings_cubit.dart';
import '../../../resources/color_manager.dart';

class AddImageHeader extends StatelessWidget {
  const AddImageHeader(
      {super.key, required this.firstStyle, required this.secondStyle});
  final TextStyle firstStyle;
  final TextStyle secondStyle;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                S.current.upload_image,
                style: firstStyle,
              ),
            ),
            Text(
              S.current.remember,
              style: secondStyle.copyWith(
                color: ColorManager.red,
              ),
              maxLines: 3,
            ),
          ],
        );
      },
    );
  }
}
