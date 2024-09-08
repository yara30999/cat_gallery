import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../../../../../../domain/entities/cat_with_click_entity.dart';
import '../../../../../01_login-register-forgotpass/view_model/auth_cubit/auth_cubit.dart';
import '../../../../../resources/values_manager.dart';
import '../../view_model/get_uploads_cubit/uploads_cubit.dart';
import 'upload_image_with_click_options_and_date.dart';

// replace with any entity according to the logic requirements in future...
// List<CatWithClickEntity> get items => [
//       const CatWithClickEntity(
//           imageId: '123456789',
//           imageUrl:
//               "https://images.pexels.com/photos/326875/pexels-photo-326875.jpeg?cs=srgb&dl=adorable-animal-blur-326875.jpg&fm=jpg",
//           favorite: Favourite(id: 1234567555),
//           vote: Vote(id: 252536945, value: 5),
//           categories: null,
//           createdAt: null),
//       const CatWithClickEntity(
//           imageId: '123456789',
//           imageUrl:
//               "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRzdWHcffKPDbUMWEVLor3x7sknODQ7SP-Qmw&s",
//           favorite: null,
//           vote: Vote(id: 252536945, value: 9),
//           categories: null,
//           createdAt: null),
//       const CatWithClickEntity(
//           imageId: '123456789',
//           imageUrl:
//               "https://th.bing.com/th/id/OIP.XgYNEaDoZZteH9cOcEcutAHaE9?w=1920&h=1285&rs=1&pid=ImgDetMain",
//           favorite: Favourite(id: 1234567555),
//           vote: Vote(id: 252536945, value: -4),
//           categories: null,
//           createdAt: null),
//       const CatWithClickEntity(
//           imageId: '123456789',
//           imageUrl:
//               "https://i.pinimg.com/736x/e6/9b/6f/e69b6feb89a524682cf149d527026893--chats-tabby-tabby-cats.jpg",
//           favorite: Favourite(id: 1234567555),
//           vote: null,
//           categories: null,
//           createdAt: null),
//       const CatWithClickEntity(
//           imageId: '123456789',
//           imageUrl:
//               "https://th.bing.com/th/id/R.7f9f4e77e7173103994679909a4b53c6?rik=OVKjg3yCUVYuKw&pid=ImgRaw&r=0",
//           favorite: null,
//           vote: null,
//           categories: null,
//           createdAt: null),
//       const CatWithClickEntity(
//           imageId: '123456789',
//           imageUrl:
//               "https://i.pinimg.com/736x/e6/9b/6f/e69b6feb89a524682cf149d527026893--chats-tabby-tabby-cats.jpg",
//           favorite: null,
//           vote: null,
//           categories: null,
//           createdAt: null),
//     ];
class UploadsPaginationGridBuilder extends StatefulWidget {
  final List<CatWithClickEntity> catImages;
  const UploadsPaginationGridBuilder({super.key, required this.catImages});

  @override
  State<UploadsPaginationGridBuilder> createState() =>
      _UploadsPaginationGridBuilderState();
}

class _UploadsPaginationGridBuilderState
    extends State<UploadsPaginationGridBuilder> {
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
    BlocProvider.of<UploadsCubit>(context)
        .getUploads(uid: uid, pageNum: nextPage++);
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
              child: UploadImageWithClickOptionsAndDate(
                catWithClickEntity: widget.catImages[index],
              ),
            );
          } else {
            /*so the two-third index did not change, 
            so the last pagination request returns an empty list
            so the entire length of the original list did not change  
            so there is no more images/data ,therefore  no need to trigger the requist any more..
            */
            return UploadImageWithClickOptionsAndDate(
              catWithClickEntity: widget.catImages[index],
            );
          }
        }
        return UploadImageWithClickOptionsAndDate(
          catWithClickEntity: widget.catImages[index],
        );
      },
    );
  }
}
