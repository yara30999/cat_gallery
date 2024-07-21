import 'package:flutter/material.dart';
import '../../../resources/color_manager.dart';
import 'cat_cashed_image.dart';

class CatPinchZoomImage extends StatefulWidget {
  final String imgUrl;
  const CatPinchZoomImage({super.key, required this.imgUrl});

  @override
  State<CatPinchZoomImage> createState() => _CatPinchZoomImageState();
}

class _CatPinchZoomImageState extends State<CatPinchZoomImage>
    with SingleTickerProviderStateMixin {
  final double minScale = 1;
  final double maxScale = 4;
  late TransformationController transformationController;
  late AnimationController animationController;
  late Animation<Matrix4>? animation;
  double scale = 1;
  OverlayEntry? entry;

  @override
  void initState() {
    super.initState();

    transformationController = TransformationController();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200))
      ..addListener(() => transformationController.value = animation!.value)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          removeOverlay();
        }
      });
  }

  @override
  void dispose() {
    super.dispose();
    transformationController.dispose();
    animationController.dispose();
  }

  void resetAnimation() {
    /*creates a tween animation from the current transformation matrix to
      the identity matrix (no transformation) and starts the animation.
    */
    animation = Tween<Matrix4>(
            begin: transformationController.value, end: Matrix4.identity())
        .animate(
            CurvedAnimation(parent: animationController, curve: Curves.linear));
    animationController.forward(from: 0.0);
  }

  void showOverlay(BuildContext context) {
    final renderBox = context.findRenderObject()! as RenderBox;
    final offset = renderBox.localToGlobal(Offset.zero);
    final width = MediaQuery.sizeOf(context).width;
    entry = OverlayEntry(
      builder: (context) {
        final double opacity = ((scale - 1) / (maxScale - 1)).clamp(0.3, 1);
        return Stack(children: [
          Positioned.fill(
            child: Opacity(
              opacity: opacity,
              child: Container(
                color: ColorManager.black,
              ),
            ),
          ),
          Positioned(
              left: offset.dx,
              top: offset.dy,
              width: width,
              child: _buildImage()),
        ]);
      },
    );
    final overlay = Overlay.of(context);
    overlay.insert(entry!);
  }

  void removeOverlay() {
    entry?.remove();
    entry = null;
  }

  @override
  Widget build(BuildContext context) {
    return _buildImage();
  }

  Widget _buildImage() {
    return Builder(
      builder: (context) => InteractiveViewer(
        transformationController: transformationController,
        clipBehavior: Clip.none,
        minScale: minScale,
        maxScale: maxScale,
        panEnabled: false,
        onInteractionStart: (details) {
          if (details.pointerCount < 2) return;
          showOverlay(context);
        },
        onInteractionEnd: (details) {
          resetAnimation();
        },
        onInteractionUpdate: (details) {
          if (entry == null) return;
          scale = details.scale;
          entry!.markNeedsBuild();
        },
        child: CatCashedImage(imgUrl: widget.imgUrl),
      ),
    );
  }
}
