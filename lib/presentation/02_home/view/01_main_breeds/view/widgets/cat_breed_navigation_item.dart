import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../domain/entities/cat_breed_card.dart';
import '../../../../../01_login-register-forgotpass/view_model/auth_cubit/auth_cubit.dart';
import '../../../../../03_specific_breed/view_model/breed/specific_breed_cubit.dart';
import '../../../../../03_specific_breed/view_model/images/specific_images_cubit.dart';
import '../../../../../resources/color_manager.dart';
import '../../../../../resources/platform_manager.dart';
import '../../../../../resources/routes_manager.dart';
import '../../../../../resources/styles_manager.dart';
import '../../../../../resources/values_manager.dart';
import '../../../widgets/images_widgets/cat_cashed_image.dart';
import '../../../widgets/images_widgets/cat_network_image.dart';

class CatBreedNavigationItem extends StatelessWidget {
  final CatBreedCardEntity catBreedCard;

  const CatBreedNavigationItem({
    super.key,
    required this.catBreedCard,
  });

  void _catImageOnTap(BuildContext context) {
    var uid = context.read<AuthCubit>().authObj!.uid;
    var breedID = catBreedCard.breedId;
    var breedName = catBreedCard.breedName;
    //pass data
    BlocProvider.of<SpecificBreedCubit>(context).breedName = breedName;
    BlocProvider.of<SpecificBreedCubit>(context).breedId = breedID;
    // and trigger request...
    context.read<SpecificBreedCubit>().getBreedInfo(uid: uid);
    context
        .read<SpecificImagesCubit>()
        .getBreedImages(uid: uid, breedId: breedID, pageNum: 0);
    //then navigate
    Navigator.pushNamed(context, Routes.specificBreedRoute);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _catImageOnTap(context);
      },
      child: Material(
        elevation: AppSize.s8,
        borderRadius: BorderRadius.circular(AppSize.s28),
        clipBehavior: Clip.antiAlias,
        color: Theme.of(context).disabledColor,
        child: Column(
          children: [
            PlatformWidget(
                androidIos: (context) =>
                    CatCashedImage(imgUrl: catBreedCard.referenceImgurl),
                web: (context) =>
                    CatNetworkImage(imgUrl: catBreedCard.referenceImgurl),
                desktop: (context) =>
                    CatCashedImage(imgUrl: catBreedCard.referenceImgurl)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(catBreedCard.breedName,
                  textAlign: TextAlign.center,
                  style:
                      Styles.style18Bold().copyWith(color: ColorManager.white)),
            ),
          ],
        ),
      ),
    );
  }
}
