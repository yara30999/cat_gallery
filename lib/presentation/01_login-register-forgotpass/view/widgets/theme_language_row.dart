import 'package:animated_icon_button/animated_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../02_home_screen/view/widgets/action_button.dart';
import '../../../02_home_screen/view_model/settings_cubit/settings_cubit.dart';
import '../../../resources/routes_manager.dart';
import '../../../resources/values_manager.dart';

class ThemeLanguageRow extends StatefulWidget {
  //take it value only once for the first time
  final ThemeMode currentTheme;
  const ThemeLanguageRow({
    super.key,
    required this.currentTheme,
  });

  @override
  State<ThemeLanguageRow> createState() => _ThemeLanguageRowState();
}

class _ThemeLanguageRowState extends State<ThemeLanguageRow> {
  List<AnimatedIconItem> _buildIconList(SettingsCubit settingsCubit) {
    return widget.currentTheme == ThemeMode.light
        ? //if it was light mode ,first icon will be dark mode to choose
        [
            AnimatedIconItem(
              icon: const Icon(Icons.dark_mode, color: Colors.blue),
              onPressed: () {
                if (settingsCubit.currentTheme != ThemeMode.dark) {
                  settingsCubit.setTheme(ThemeMode.dark);
                }
              },
              backgroundColor: Colors.transparent,
            ),
            AnimatedIconItem(
              icon: const Icon(Icons.sunny, color: Colors.yellow),
              onPressed: () {
                if (settingsCubit.currentTheme != ThemeMode.light) {
                  settingsCubit.setTheme(ThemeMode.light);
                }
              },
              backgroundColor: Colors.transparent,
            ),
          ]
        : // and if it was dark mode ,first icon will be light mode to choose
        [
            AnimatedIconItem(
              icon: const Icon(Icons.sunny, color: Colors.yellow),
              onPressed: () {
                if (settingsCubit.currentTheme != ThemeMode.light) {
                  settingsCubit.setTheme(ThemeMode.light);
                }
              },
              backgroundColor: Colors.transparent,
            ),
            AnimatedIconItem(
              icon: const Icon(Icons.dark_mode, color: Colors.blue),
              onPressed: () {
                if (settingsCubit.currentTheme != ThemeMode.dark) {
                  settingsCubit.setTheme(ThemeMode.dark);
                }
              },
              backgroundColor: Colors.transparent,
            ),
          ];
  }

  @override
  Widget build(BuildContext context) {
    final settingsCubit = BlocProvider.of<SettingsCubit>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AnimatedIconButton(
          duration: const Duration(milliseconds: 200),
          icons: _buildIconList(settingsCubit),
        ),
        ActionButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.selectLanguageRoute);
            },
            iconsSize: AppSize.s30,
            icon: Icons.language),
      ],
    );
  }
}
