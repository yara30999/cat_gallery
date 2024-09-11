import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../app/functions.dart';
import '../../../../data/request_body/favourite_body.dart';
import '../../../../domain/entities/cat_with_click_entity.dart';
import '../../../01_login-register-forgotpass/view_model/auth_cubit/auth_cubit.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/values_manager.dart';
import '../02_favorites/view_model/add_del_favourite_cubit/like_unlike_cubit.dart';

class FavoriteButton extends StatefulWidget {
  final CatWithClickEntity catWithClickEntity;
  const FavoriteButton({
    super.key,
    required this.catWithClickEntity,
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

    isFavorite = widget.catWithClickEntity.favorite == null ? false : true;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleFavourite(BuildContext context, String uid) async {
    if (!isFavorite) {
      //controller works only in like direction...
      _controller.forward().then((_) => _controller.reverse());
    }
    setState(() {
      //toggle favourite button
      isFavorite = !isFavorite;
    });
    if (isFavorite == true) {
      // like image.....
      FavouriteBody body = FavouriteBody(
        subId: uid,
        imageId: widget.catWithClickEntity.imageId,
      );
      await BlocProvider.of<LikeUnlikeCubit>(context).like(favouriteBody: body);
    } else {
      // unlike image.....
      var favId = widget.catWithClickEntity.favorite?.id ?? 0;
      await BlocProvider.of<LikeUnlikeCubit>(context)
          .unlike(uid: uid, favId: favId.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    var uid = context.read<AuthCubit>().authObj!.uid;
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
            onPressed: () {
              _toggleFavourite(context, uid);
            },
          ),
        );
      },
    );
  }
}
