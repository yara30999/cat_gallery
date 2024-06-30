import 'package:flutter/material.dart';
import '../../../../app/constants.dart';
import '../../../resources/font_manager.dart';
import '../../../resources/routes_manager.dart';
import '../../../resources/styles_manager.dart';
import '../../../resources/values_manager.dart';
import '../../widgets/custom_app_bar.dart';

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
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: widget.mainBreedsScreenScrollController,
      slivers: [
        SliverPersistentHeader(
          //floating: true,
          pinned: true,
          delegate: MySliverPersistentHeaderDelegate(
              minHeight: Constants.appBarHeight,
              maxHeight: Constants.appBarHeight,
              child: const CustomAppBar()),
        ),
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
                  "main breeds body",
                  style: Styles.style40Black(context,
                      englishFontFamily: FontConstants.font3DancingScript),
                ),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          Routes.specificBreedRoute,
                        ); // Navigate to specific breed route
                      },
                      child: const Text('specific breed screen '),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          Routes.randomBreedRoute,
                        ); // Navigate to specific breed route
                      },
                      child: const Text('random breed screen '),
                    ),
                  ],
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
