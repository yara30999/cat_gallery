import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../domain/entities/user_info_entity.dart';
import '../../../resources/assets_manager.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/styles_manager.dart';
import '../../../resources/values_manager.dart';

class UserInfoListTile extends StatelessWidget {
  const UserInfoListTile({
    super.key,
    required this.userInfoEntity,
  });
  final UserInfoEntity userInfoEntity;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: AspectRatio(
          aspectRatio: 1,
          child: Container(
            decoration: BoxDecoration(
              color: ColorManager.white,
              borderRadius: BorderRadius.circular(AppSize.s8),
            ),
            child: Center(child: SvgPicture.asset(SvgAssets.drawer2)),
          ),
        ),
        title: FittedBox(
          alignment: AlignmentDirectional.centerStart,
          fit: BoxFit.scaleDown,
          child: Text(
            userInfoEntity.name,
            style: Styles.style16Medium(),
          ),
        ),
        subtitle: FittedBox(
          alignment: AlignmentDirectional.centerStart,
          fit: BoxFit.scaleDown,
          child: Text(
            userInfoEntity.email,
            style: Styles.style14Medium(),
          ),
        ),
      ),
    );
  }
}
