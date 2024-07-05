import 'package:flutter/material.dart';
import '../02_home/widgets/custom_app_bar.dart';
import '../resources/font_manager.dart';
import '../resources/styles_manager.dart';
import '../resources/values_manager.dart';

class RandomBreedBody extends StatefulWidget {
  final ScrollController randomBreedScreenScrollController;
  const RandomBreedBody({
    super.key,
    required this.randomBreedScreenScrollController,
  });

  @override
  State<RandomBreedBody> createState() => _RandomBreedBodyState();
}

class _RandomBreedBodyState extends State<RandomBreedBody> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: widget.randomBreedScreenScrollController,
      slivers: [
        const PersistentAppBar(),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppPadding.p16,
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: AppSize.s10,
                ),
                Text(
                  "random breed body",
                  style: Styles.style40Black(context,
                      englishFontFamily: FontConstants.font3DancingScript),
                ),
                ListView.separated(
                  // controller: _scrollController,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return const ListTile(
                      title: Text("I maybe a notification!"),
                      leading: Icon(Icons.notification_important),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      height: 10,
                    );
                  },
                  itemCount: 50,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
