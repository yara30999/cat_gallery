import 'package:flutter/material.dart';
import '../../../02_home/widgets/images_widgets/cat_cashed_image.dart';
import '../../../02_home/widgets/images_widgets/cat_network_image.dart';
import '../../../02_home/widgets/images_widgets/cat_pinch_zoom_image.dart';
import '../../../resources/platform_manager.dart';
import '../../../resources/values_manager.dart';

class AnalysisImage extends StatelessWidget {
  const AnalysisImage({super.key, required this.imgUrl});
  final String imgUrl;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      // shadowColor: Colors.transparent,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.s20),
      ),
      child: PlatformWidget(
          androidIos: (context) => CatPinchZoomImage(
                imgUrl: imgUrl,
              ),
          web: (context) => CatNetworkImage(imgUrl: imgUrl),
          desktop: (context) => CatCashedImage(imgUrl: imgUrl)),
    );
  }
}
