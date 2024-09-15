import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../view_model/settings_cubit/settings_cubit.dart';

class FavoriteScreenHeader extends StatelessWidget {
  const FavoriteScreenHeader({super.key, required this.headerStyle});
  final TextStyle headerStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BlocBuilder<SettingsCubit, SettingsState>(
          builder: (context, state) {
            return Text(
              S.current.Favorites,
              style: headerStyle,
            );
          },
        ),
      ],
    );
  }
}
