import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../domain/entities/drawer_item_entity.dart';
import '../../../../generated/l10n.dart';
import '../../../resources/styles_manager.dart';
import '../../../resources/values_manager.dart';
import '../../view_model/settings_cubit/settings_cubit.dart';
import 'active_inactive_drawer_item.dart';

class ThemeButton extends StatelessWidget {
  const ThemeButton({
    super.key,
  });

  void _onThemeChange(BuildContext context, ThemeMode? themeMode) {
    BlocProvider.of<SettingsCubit>(context).setTheme(themeMode!);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InActiveDrawerItem(
              drawerItemEntity: DrawerItemEntity(
                  title: S.current.Theme, icon: Icons.wb_incandescent_outlined),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p12),
              child: Wrap(children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Radio<ThemeMode>(
                      value: ThemeMode.system,
                      groupValue:
                          BlocProvider.of<SettingsCubit>(context).currentTheme,
                      onChanged: (value) {
                        _onThemeChange(context, value);
                      },
                    ),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        S.current.System,
                        style: Styles.style16Medium(),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: AppSize.s10,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Radio<ThemeMode>(
                      value: ThemeMode.light,
                      groupValue:
                          BlocProvider.of<SettingsCubit>(context).currentTheme,
                      onChanged: (value) {
                        _onThemeChange(context, value);
                      },
                    ),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        S.current.Light,
                        style: Styles.style16Medium(),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: AppSize.s10,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Radio<ThemeMode>(
                      value: ThemeMode.dark,
                      groupValue:
                          BlocProvider.of<SettingsCubit>(context).currentTheme,
                      onChanged: (value) {
                        BlocProvider.of<SettingsCubit>(context)
                            .setTheme(value!);
                      },
                    ),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        S.current.Dark,
                        style: Styles.style16Medium(),
                      ),
                    ),
                  ],
                ),
              ]),
            ),
          ],
        );
      },
    );
  }
}
