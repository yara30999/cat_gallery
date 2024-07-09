import 'package:flutter/material.dart';
import '../02_home/widgets/custom_app_bar.dart';
import '../resources/styles_manager.dart';
import '../resources/values_manager.dart';

class SpecificBreedBody extends StatefulWidget {
  final ScrollController specificBreedScreenScrollController;
  const SpecificBreedBody({
    super.key,
    required this.specificBreedScreenScrollController,
  });

  @override
  State<SpecificBreedBody> createState() => _SpecificBreedBodyState();
}

class _SpecificBreedBodyState extends State<SpecificBreedBody> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: widget.specificBreedScreenScrollController,
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
                  "specific breed body",
                  style: Styles.style36Medium(),
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
