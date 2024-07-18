import 'package:flutter/material.dart';
import '../../resources/color_manager.dart';

class CustomFadingImage extends StatefulWidget {
  const CustomFadingImage({super.key});
  @override
  State<CustomFadingImage> createState() => _CustomFadingImageState();
}

class _CustomFadingImageState extends State<CustomFadingImage>
    with SingleTickerProviderStateMixin {
  late Animation animation;
  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));

    animation = Tween<double>(begin: .2, end: .8).animate(animationController);

    animationController.addListener(() {
      setState(() {});
    });

    animationController.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: animation.value,
      child: Container(
        width: double.infinity,
        color: ColorManager.grey1,
      ),
    );
  }
}
