import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../../../../domain/entities/cat_with_click_entity.dart';
import '../../../01_login-register-forgotpass/view_model/auth_cubit/auth_cubit.dart';
import '../../../resources/values_manager.dart';
import '../../../02_home_screen/view/widgets/cat_image_with_click_options.dart';
import '../../view_model/bloc/no_breed_bloc.dart';

class NoBreedPaginationGridBuilder extends StatefulWidget {
  final List<CatWithClickEntity> catImages;
  const NoBreedPaginationGridBuilder({
    super.key,
    required this.catImages,
  });

  @override
  State<NoBreedPaginationGridBuilder> createState() =>
      _NoBreedPaginationGridBuilderState();
}

class _NoBreedPaginationGridBuilderState
    extends State<NoBreedPaginationGridBuilder> {
  var isLoading = false;
  var nextPage = 1;
  var previousIndex = 0;

  void _handleVisibilityChange(VisibilityInfo info, String uid) {
    if (info.visibleFraction > 0 && !isLoading) {
      _fetchMoreData(uid);
    }
  }

  void _fetchMoreData(String uid) {
    isLoading = true;
    BlocProvider.of<NoBreedBloc>(context)
        .add(CategoryImagesEvent(uid: uid, pageNum: nextPage++));
    isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    var uid = BlocProvider.of<AuthCubit>(context).authObj!.uid;
    return MasonryGridView.count(
      itemCount: widget.catImages.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      mainAxisSpacing: AppPadding.p20,
      crossAxisSpacing: AppPadding.p10,
      crossAxisCount: 1,
      itemBuilder: (context, index) {
        var twoThirdsIndex = (widget.catImages.length * 2 / 3).round();
        if (index == twoThirdsIndex) {
          if (twoThirdsIndex != previousIndex) {
            /*this means that the length of the list has been changed,
            also the pagination works and added some image to the list,
            so the two-third index must be changed also
            */
            previousIndex = twoThirdsIndex;
            /*use the visibilityDetector to trigger the request at the two-third index,
            in case if there is more image/data we did have it yet
            */
            return VisibilityDetector(
              key: const Key('two-thirds-point'),
              onVisibilityChanged: (VisibilityInfo info) {
                _handleVisibilityChange(info, uid);
              },
              child: CatImageWithClickOptions(
                catWithClickEntity: widget.catImages[index],
              ),
            );
          } else {
            /*so the two-third index did not change, 
            so the last pagination request returns an empty list
            so the entire length of the original list did not change  
            so there is no more images/data ,therefore  no need to trigger the requist any more..
            */
            return CatImageWithClickOptions(
              catWithClickEntity: widget.catImages[index],
            );
          }
        }
        return CatImageWithClickOptions(
          catWithClickEntity: widget.catImages[index],
        );
      },
    );
  }
}
