import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';
import '../../resources/styles_manager.dart';
import '../../resources/values_manager.dart';

class AppDeveloper extends StatelessWidget {
  const AppDeveloper({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.s100,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(AppSize.s10),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            S.current.app_developer,
            style: Styles.style16Medium(),
          ),
        ),
      ),
    );
  }
}
