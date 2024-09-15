import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'language_item.dart';
import '../../../../generated/l10n.dart';
import '../../../02_home_screen/view_model/settings_cubit/settings_cubit.dart';
import '../../../resources/conistants_manager.dart';
import '../../../resources/language_manager.dart';
import '../../../resources/values_manager.dart';

class LanguageSelection extends StatefulWidget {
  const LanguageSelection({super.key});

  @override
  State<LanguageSelection> createState() => _LanguageSelectionState();
}

class _LanguageSelectionState extends State<LanguageSelection> {
  late int _currentPage;
  List<String> get languages => [
        S.current.English,
        S.current.Arabic,
      ];

  void onTabTapped(int index) {
    if (_currentPage != index) {
      setState(() {
        _currentPage = index;
      });
      switch (index) {
        case 0:
          BlocProvider.of<SettingsCubit>(context)
              .setLocale(LocalizationUtils.englishLocal);
          break;
        case 1:
          BlocProvider.of<SettingsCubit>(context)
              .setLocale(LocalizationUtils.arabicLocal);
          break;
        default:
          BlocProvider.of<SettingsCubit>(context)
              .setLocale(LocalizationUtils.englishLocal);
      }
      Future.delayed(const Duration(seconds: AppConstants.waitDelay), () {
        if (mounted) {
          Navigator.pop(context);
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _currentPage = BlocProvider.of<SettingsCubit>(context).currentLocale ==
            LocalizationUtils.englishLocal
        ? 0
        : 1;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(0.0),
      itemCount: languages.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: AppSize.s10),
          child: InkWell(
            mouseCursor: SystemMouseCursors.click,
            onTap: () {
              onTabTapped(index);
            },
            child: LanguageItem(
              name: languages[index],
              isActive: _currentPage == index,
            ),
          ),
        );
      },
    );
  }
}
