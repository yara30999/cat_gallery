import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../resources/values_manager.dart';
import '../../../../view_model/settings_cubit/settings_cubit.dart';
import '../../../widgets/custom_search_field.dart';
import 'paragraph_with_click.dart';

class MainBreedsHeader extends StatelessWidget {
  const MainBreedsHeader({
    super.key,
    required this.headerStyle,
  });
  final TextStyle headerStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: AppSize.s10,
        ),
        BlocBuilder<SettingsCubit, SettingsState>(
          builder: (context, state) {
            return Text(
              S.current.main_breeds,
              style: headerStyle,
            );
          },
        ),
        const CustomSearchField(),
        const SizedBox(
          height: AppSize.s10,
        ),
        const ParagraphStartsWithClickText(),
      ],
    );
  }
}
