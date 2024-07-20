import 'package:flutter/material.dart';

import '../../../domain/entities/drawer_item_entity.dart';
import 'active_inactive_drawer_item.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem(
      {super.key, required this.drawerItemEntity, required this.isActive});

  final DrawerItemEntity drawerItemEntity;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      firstCurve: Curves.linear,
      secondCurve: Curves.linear,
      duration: const Duration(milliseconds: 300),
      firstChild: ActiveDrawerItem(drawerItemEntity: drawerItemEntity),
      secondChild: InActiveDrawerItem(drawerItemEntity: drawerItemEntity),
      crossFadeState:
          isActive ? CrossFadeState.showFirst : CrossFadeState.showSecond,
    );
  }
}
