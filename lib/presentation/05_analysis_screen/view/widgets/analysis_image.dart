import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../02_home_screen/view/widgets/images_widgets/cat_cashed_image.dart';
import '../../../02_home_screen/view/widgets/images_widgets/cat_network_image.dart';
import '../../../02_home_screen/view/widgets/images_widgets/cat_pinch_zoom_image.dart';
import '../../../resources/platform_manager.dart';
import '../../../resources/values_manager.dart';
import '../../view_model/cubit/analysis_cubit.dart';

class AnalysisImage extends StatelessWidget {
  const AnalysisImage({super.key});

  @override
  Widget build(BuildContext context) {
    String imgUrl = context.read<AnalysisCubit>().imgUrl;
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
