import 'package:flutter/material.dart';
import '../../../resources/styles_manager.dart';
import '../../../resources/values_manager.dart';
import '../../widgets/custom_app_bar.dart';

class VotesViewBody extends StatefulWidget {
  final ScrollController? votesScreenScrollController;
  const VotesViewBody({super.key, required this.votesScreenScrollController});

  @override
  State<VotesViewBody> createState() => _VotesViewBodyState();
}

class _VotesViewBodyState extends State<VotesViewBody> {
  @override
  void dispose() {
    widget.votesScreenScrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: widget.votesScreenScrollController,
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
                  'votes screen ',
                  style: Styles.style36Medium(),
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
