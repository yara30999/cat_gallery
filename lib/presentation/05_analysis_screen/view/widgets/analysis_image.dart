// ignore_for_file: file_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../02_home/widgets/custom_fade_image.dart';
import '../../../resources/values_manager.dart';

class AnalysisImage extends StatelessWidget {
  const AnalysisImage({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2 / 1.6,
      child: Card(
        color: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        // shadowColor: Colors.transparent,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s20),
        ),
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          width: double.infinity,
          imageUrl:
              "https://th.bing.com/th/id/R.7f9f4e77e7173103994679909a4b53c6?rik=OVKjg3yCUVYuKw&pid=ImgRaw&r=0",
          errorWidget: (context, url, error) => const Icon(Icons.error),
          placeholder: (context, url) => const CustomFadingImage(),
        ),
      ),
    );
  }
}
