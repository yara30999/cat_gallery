import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../generated/l10n.dart';
import '../../../02_home/view_model/settings_cubit/settings_cubit.dart';
import 'sort_popup_menu.dart';

class NoBreedHeader extends StatelessWidget {
  const NoBreedHeader({
    super.key,
    required this.headerStyle,
  });
  final TextStyle headerStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BlocBuilder<SettingsCubit, SettingsState>(
          builder: (context, state) {
            return Text(
              S.current.random_cat_images,
              style: headerStyle,
            );
          },
        ),
        const SortPopupMenu(),
      ],
    );
  }
}
