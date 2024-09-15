import 'package:flutter/material.dart';

import '../../../../domain/entities/drawer_item_entity.dart';
import '../../../resources/styles_manager.dart';
import '../../../resources/values_manager.dart';

class InActiveDrawerItem extends StatelessWidget {
  const InActiveDrawerItem({
    super.key,
    required this.drawerItemEntity,
  });

  final DrawerItemEntity drawerItemEntity;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(drawerItemEntity.icon),
      title: FittedBox(
        alignment: AlignmentDirectional.centerStart,
        fit: BoxFit.scaleDown,
        child: Text(
          drawerItemEntity.title,
          style: Styles.style16Medium(),
        ),
      ),
    );
  }
}

class ActiveDrawerItem extends StatelessWidget {
  const ActiveDrawerItem({
    super.key,
    required this.drawerItemEntity,
  });

  final DrawerItemEntity drawerItemEntity;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).unselectedWidgetColor,
      borderRadius: BorderRadius.circular(AppSize.s15),
      child: ListTile(
        leading: Icon(
          drawerItemEntity.icon,
          color: Theme.of(context).primaryColor,
        ),
        title: FittedBox(
          alignment: AlignmentDirectional.centerStart,
          fit: BoxFit.scaleDown,
          child: Text(
            drawerItemEntity.title,
            style: Styles.style16Medium()
                .copyWith(color: Theme.of(context).primaryColor),
          ),
        ),
      ),
    );
  }
}
