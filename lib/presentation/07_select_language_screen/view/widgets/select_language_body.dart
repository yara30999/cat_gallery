import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../domain/entities/drawer_item_entity.dart';
import '../../../../generated/l10n.dart';
import '../../../02_home_screen/view/widgets/active_inactive_drawer_item.dart';
import '../../../02_home_screen/view_model/settings_cubit/settings_cubit.dart';
import '../../../resources/values_manager.dart';
import 'language_selection.dart';

class SelectLanguageBody extends StatelessWidget {
  const SelectLanguageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSize.s20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            BlocBuilder<SettingsCubit, SettingsState>(
              builder: (context, state) {
                return InActiveDrawerItem(
                  drawerItemEntity: DrawerItemEntity(
                      title: S.current.Language, icon: Icons.language_sharp),
                );
              },
            ),
            const LanguageSelection(),
          ],
        ),
      ),
    );
  }
}
