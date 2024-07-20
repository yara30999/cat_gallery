import 'package:flutter/material.dart';
import '../../../domain/entities/drawer_item_entity.dart';
import '../../../generated/l10n.dart';
import '../../resources/styles_manager.dart';
import '../../resources/values_manager.dart';
import 'active_inactive_drawer_item.dart';

class ThemeButton extends StatefulWidget {
  const ThemeButton({
    super.key,
  });

  @override
  State<ThemeButton> createState() => _ThemeButtonState();
}

class _ThemeButtonState extends State<ThemeButton> {
  ThemeMode? currentThemeMode = ThemeMode.system;

  void _onRadioButtonPressed(ThemeMode? value) {
    if (value != currentThemeMode) {
      setState(() {
        currentThemeMode = value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
                  groupValue: currentThemeMode,
                  onChanged: (value) {
                    _onRadioButtonPressed(value);
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
                  groupValue: currentThemeMode,
                  onChanged: (value) {
                    _onRadioButtonPressed(value);
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
                  groupValue: currentThemeMode,
                  onChanged: (value) {
                    _onRadioButtonPressed(value);
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
  }
}
