import 'package:flutter/material.dart';
import '../../../domain/entities/drawer_item_entity.dart';
import '../../../generated/l10n.dart';
import '../../resources/language_manager.dart';
import '../../resources/styles_manager.dart';
import '../../resources/values_manager.dart';
import 'active_inactive_drawer_item.dart';

class LanguageButton extends StatefulWidget {
  const LanguageButton({
    super.key,
  });

  @override
  State<LanguageButton> createState() => _LanguageButtonState();
}

class _LanguageButtonState extends State<LanguageButton> {
  Locale? currentLocale = LocalizationUtils.englishLocal;

  void _onRadioButtonPressed(Locale? value) {
    if (value != currentLocale) {
      setState(() {
        currentLocale = value;
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
              title: S.current.Language, icon: Icons.wb_incandescent_outlined),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p12),
          child: Wrap(children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Radio<Locale>(
                  value: LocalizationUtils.englishLocal,
                  groupValue: currentLocale,
                  onChanged: (value) {
                    _onRadioButtonPressed(value);
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
                  groupValue: currentLocale,
                  onChanged: (value) {
                    _onRadioButtonPressed(value);
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
  }
}
