import 'package:flutter/material.dart';
import '../../../../app/constants.dart';
import '../../../resources/font_manager.dart';
import '../../../resources/styles_manager.dart';
import '../../../resources/values_manager.dart';
import '../../widgets/custom_app_bar.dart';

class UploadsViewBody extends StatefulWidget {
  final ScrollController uploadsScreenScrollController;
  const UploadsViewBody(
      {super.key, required this.uploadsScreenScrollController});

  @override
  State<UploadsViewBody> createState() => _UploadsViewBodyState();
}

class _UploadsViewBodyState extends State<UploadsViewBody> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: widget.uploadsScreenScrollController,
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
                  'upload screen ',
                  style: Styles.style40Black(context,
                      englishFontFamily: FontConstants.font3DancingScript),
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pop(); // Navigate back to previous screen (HomeViewBody)
                    },
                    child: const Text('Go back / must be nested nave'),
                  ),
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
