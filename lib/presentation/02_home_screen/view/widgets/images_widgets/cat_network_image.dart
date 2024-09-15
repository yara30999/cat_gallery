import 'package:flutter/material.dart';
import '../../../../../generated/l10n.dart';
import '../../../../resources/assets_manager.dart';
import '../../../../resources/styles_manager.dart';

class CatNetworkImage extends StatelessWidget {
  const CatNetworkImage({
    super.key,
    required this.imgUrl,
  });

  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    if (imgUrl == '') {
      return Image.asset(
        ImageAssets.imageNotFound,
        fit: BoxFit.cover,
      );
    } else {
      return Image.network(
        imgUrl,
        width: double.infinity,
        fit: BoxFit.cover,
        loadingBuilder: (BuildContext context, Widget child,
            ImageChunkEvent? loadingProgress) {
          if (loadingProgress == null) {
            return child;
          } else {
            return Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                    : null,
              ),
            );
          }
        },
        errorBuilder:
            (BuildContext context, Object error, StackTrace? stackTrace) {
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
      );
    }
  }
}
