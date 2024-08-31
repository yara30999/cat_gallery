import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../../generated/l10n.dart';
import '../../../../resources/assets_manager.dart';
import '../../../../resources/styles_manager.dart';

class CatCashedImage extends StatelessWidget {
  const CatCashedImage({super.key, required this.imgUrl});

  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    if (imgUrl == '') {
      return Image.asset(
        ImageAssets.imageNotFound,
        fit: BoxFit.cover,
      );
    } else {
      return CachedNetworkImage(
        imageUrl: imgUrl,
        width: double.infinity,
        fit: BoxFit.cover,
        errorWidget: (context, url, error) {
          debugPrint('Image failed yyyyyyara: $error');
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error, color: Colors.red),
                Text(
                  S.current.Failed_to_load_image,
                  style: Styles.style14Medium(),
                ),
              ],
            ),
          );
        },
        // placeholder: (context, url) => Image.asset(
        //   ImageAssets.loading,
        //   fit: BoxFit.cover,
        // ),
      );
    }
  }
}
