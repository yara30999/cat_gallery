import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../../app/functions.dart';
import '../../../../generated/l10n.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/font_manager.dart';
import '../../../resources/routes_manager.dart';
import '../../../resources/styles_manager.dart';
import '../../../resources/values_manager.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_search_field.dart';

class MainBreedsBody extends StatefulWidget {
  final ScrollController mainBreedsScreenScrollController;
  const MainBreedsBody({
    super.key,
    required this.mainBreedsScreenScrollController,
  });

  @override
  State<MainBreedsBody> createState() => _MainBreedsBodyState();
}

class _MainBreedsBodyState extends State<MainBreedsBody> {
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: widget.mainBreedsScreenScrollController,
      slivers: [
        const PersistentAppBar(),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppPadding.p16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: AppSize.s10,
                ),
                Text(
                  S.current.main_breeds,
                  style: Styles.style40Black(context,
                      englishFontFamily: FontConstants.font3DancingScript),
                ),
                CustomSearchField(searchController: searchController),
                const ParagraphStartsWithClickText(),
                // Row(
                //   children: [
                //     ElevatedButton(
                //       onPressed: () {
                //         Navigator.pushNamed(
                //           context,
                //           Routes.specificBreedRoute,
                //         ); // Navigate to specific breed route
                //       },
                //       child: const Text('specific breed screen '),
                //     ),
                //   ],
                // ),
                // ListView.separated(
                //   // controller: _scrollController,
                //   shrinkWrap: true,
                //   physics: const NeverScrollableScrollPhysics(),
                //   itemBuilder: (BuildContext context, int index) {
                //     return const ListTile(
                //       title: Text("I maybe a notification!"),
                //       leading: Icon(Icons.notification_important),
                //     );
                //   },
                //   separatorBuilder: (BuildContext context, int index) {
                //     return const SizedBox(
                //       height: 10,
                //     );
                //   },
                //   itemCount: 50,
                // ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ParagraphStartsWithClickText extends StatelessWidget {
  const ParagraphStartsWithClickText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TextStyle baseTextStyle = Styles.style18Medium(context,
            englishFontFamily: FontConstants.fontArCairo)
        .copyWith(
            color: isLightTheme(context)
                ? ColorManager.black
                : ColorManager.white);
    return RichText(
        text: TextSpan(style: baseTextStyle, children: [
      TextSpan(
        text: S.current.Browse_random_images_of_all_breeds,
        style: baseTextStyle.copyWith(
          color: ColorManager.blue,
          decoration: TextDecoration.underline,
          decorationColor: ColorManager.blue, // Custom underline color
          decorationStyle: TextDecorationStyle.solid,
          decorationThickness: AppSize.s2,
        ),
        recognizer: TapGestureRecognizer()
          ..onTap = () {
            Navigator.pushNamed(
              context,
              Routes.randomBreedRoute,
            );
          },
      ),
      TextSpan(
        text: S.current.main_breed_paragraph,
      ),
    ]));
  }
}
