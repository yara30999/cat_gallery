import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../domain/entities/drawer_item_entity.dart';
import '../../../../generated/l10n.dart';
import '../../../resources/language_manager.dart';
import '../../../resources/styles_manager.dart';
import '../../../resources/values_manager.dart';
import '../../view_model/settings_cubit/settings_cubit.dart';
import 'active_inactive_drawer_item.dart';

class LanguageButton extends StatelessWidget {
  const LanguageButton({
    super.key,
  });

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
                  title: S.current.Language, icon: Icons.language_sharp),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p12),
              child: Wrap(children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Radio<Locale>(
                      value: LocalizationUtils.englishLocal,
                      groupValue:
                          BlocProvider.of<SettingsCubit>(context).currentLocale,
                      onChanged: (value) {
                        BlocProvider.of<SettingsCubit>(context)
                            .setLocale(value!);
                      },
                    ),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        S.current.English,
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
                    Radio<Locale>(
                      value: LocalizationUtils.arabicLocal,
                      groupValue:
                          BlocProvider.of<SettingsCubit>(context).currentLocale,
                      onChanged: (value) {
                        BlocProvider.of<SettingsCubit>(context)
                            .setLocale(value!);
                      },
                    ),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        S.current.Arabic,
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
