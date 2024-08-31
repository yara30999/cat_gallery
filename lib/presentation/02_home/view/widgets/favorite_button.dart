import 'package:flutter/material.dart';
import '../../../../app/functions.dart';
import '../../../../domain/entities/cat_with_click_entity.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/values_manager.dart';

class FavoriteButton extends StatefulWidget {
  final Favorite? favorite;
  final VoidCallback onPressed;
  const FavoriteButton({
    super.key,
    required this.onPressed,
    required this.favorite,
  });

  @override
  FavoriteButtonState createState() => FavoriteButtonState();
}

class FavoriteButtonState extends State<FavoriteButton>
    with SingleTickerProviderStateMixin {
  late bool isFavorite;
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _animation = Tween(begin: 23.0, end: 30.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.bounceInOut),
    );

    isFavorite = widget.favorite == null ? false : true;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleFavorite() {
    if (!isFavorite) {
      _controller.forward().then((_) => _controller.reverse());
    }
    setState(() {
      isFavorite = !isFavorite;
    });
    widget.onPressed;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (BuildContext context, Widget? child) {
        return SizedBox(
          height: AppSize.s40,
          width: AppSize.s40,
          child: IconButton(
            splashColor: ColorManager.white,
            iconSize: _animation.value,
            isSelected: isFavorite,
            color:
                isLightTheme(context) ? ColorManager.black : ColorManager.white,
            icon: const Icon(Icons.favorite_border_outlined),
            selectedIcon: const Icon(Icons.favorite, color: ColorManager.red),
            onPressed: _toggleFavorite,
          ),
        );
      },
    );
  }
}
