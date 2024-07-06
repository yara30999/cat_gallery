import 'package:flutter/material.dart';
import '../../../generated/l10n.dart';
import '../../resources/color_manager.dart';
import '../../resources/conistants_manager.dart';
import '../../resources/styles_manager.dart';

class PersistentAppBar extends StatelessWidget {
  const PersistentAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      //floating: true,
      pinned: true,
      delegate: MySliverPersistentHeaderDelegate(
          minHeight: AppConstants.appBarHeight,
          maxHeight: AppConstants.appBarHeight,
          child: const CustomAppBar()),
    );
  }
}

class MySliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  MySliverPersistentHeaderDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(MySliverPersistentHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: Theme.of(context).iconTheme,
      title: Text(
        S.current.cat_gallery,
        style:
            Styles.style36Medium(context).copyWith(color: ColorManager.white),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
          ),
        ),
      ],
    );
  }
}
