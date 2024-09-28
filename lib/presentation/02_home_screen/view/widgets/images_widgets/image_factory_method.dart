import 'package:flutter/material.dart';
import 'cat_cashed_image.dart';
import 'cat_network_image.dart';
import 'cat_pinch_zoom_image.dart';

abstract class CatPhoto {
  Widget build(String imgUrl);

  factory CatPhoto(TargetPlatform targetPlatform, {bool withPinchZoom = true}) {
    switch (targetPlatform) {
      case TargetPlatform.android:
      case TargetPlatform.iOS:
        return withPinchZoom == true ? CatPinchZoomPhoto() : CatNetworkPhoto();
      case TargetPlatform.macOS:
      case TargetPlatform.windows:
      case TargetPlatform.linux:
        return CatNetworkPhoto();
      default:
        return CatNetworkPhoto();
    }
  }
}

class CatPinchZoomPhoto implements CatPhoto {
  @override
  Widget build(String imgUrl) {
    return CatPinchZoomImage(imgUrl: imgUrl);
  }
}

class CatCashedPhoto implements CatPhoto {
  @override
  Widget build(String imgUrl) {
    return CatCashedImage(imgUrl: imgUrl);
  }
}

class CatNetworkPhoto implements CatPhoto {
  @override
  Widget build(String imgUrl) {
    return CatNetworkImage(imgUrl: imgUrl);
  }
}
