import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';
import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/styles_manager.dart';
import '../../resources/values_manager.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          iconTheme: Theme.of(context).iconTheme,
          title: Text(
            S.current.cat_gallery,
            style: Styles.style40Black(context,
                    englishFontFamily: FontConstants.font3DancingScript)
                .copyWith(color: ColorManager.white),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.menu,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: AppSize.s10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.p16,
          ),
          child: Column(children: [
            Text(
              S.current.cat_gallery,
              style: Styles.style40Black(context,
                  englishFontFamily: FontConstants.font3DancingScript),
            ),
          ]),
        ),
      ],
    );
  }
}
