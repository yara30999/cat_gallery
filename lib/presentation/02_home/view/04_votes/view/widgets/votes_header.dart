import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../view_model/settings_cubit/settings_cubit.dart';

class VotesScreenHeader extends StatelessWidget {
  const VotesScreenHeader({
    super.key,
    required this.headerStyle,
  });
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
              S.current.Votes,
              style: headerStyle,
            );
          },
        ),
      ],
    );
  }
}
