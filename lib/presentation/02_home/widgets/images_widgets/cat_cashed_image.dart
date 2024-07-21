import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';
import '../../../resources/styles_manager.dart';
import '../../../resources/values_manager.dart';
import '../custom_fade_image.dart';

class CatCashedImage extends StatelessWidget {
  const CatCashedImage({super.key, required this.imgUrl});

  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: BoxFit.cover,
      width: double.infinity,
      imageUrl: imgUrl,
      errorWidget: (context, url, error) => Center(
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
      ),
      placeholder: (context, url) => const SizedBox(
          width: double.infinity,
          height: AppSize.s160,
          child: CustomFadingImage()),
    );
  }
}
