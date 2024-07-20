import 'package:flutter/material.dart';
import '../../../generated/l10n.dart';
import '../../resources/global_keys_manager.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      iconTheme: Theme.of(context).iconTheme,
      title: Text(
        S.current.cat_gallery,
      ),
      leading: IconButton(
        onPressed: () {
          GlobalKeys.scaffoldKey.currentState?.openDrawer();
        },
        icon: const Icon(
          Icons.menu,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
