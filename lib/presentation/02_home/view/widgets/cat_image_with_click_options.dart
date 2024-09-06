import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../app/di.dart';
import '../../../../domain/entities/cat_with_click_entity.dart';
import '../../../01_login-register-forgotpass/view_model/auth_cubit/auth_cubit.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/language_manager.dart';
import '../../../resources/platform_manager.dart';
import '../../../resources/routes_manager.dart';
import '../04_votes/view_model/add_vote_cubit/post_vote_cubit.dart';
import '../04_votes/view_model/get_votes_cubit/votes_cubit.dart';
import 'images_widgets/cat_cashed_image.dart';
import 'images_widgets/cat_network_image.dart';
import 'images_widgets/cat_pinch_zoom_image.dart';
import '../../../resources/values_manager.dart';
import 'action_button.dart';
import 'favorite_button.dart';
import 'vote_dialog.dart';

class CatImageWithClickOptions extends StatefulWidget {
  final CatWithClickEntity catWithClickEntity;

  const CatImageWithClickOptions({
    super.key,
    required this.catWithClickEntity,
  });

  @override
  State<CatImageWithClickOptions> createState() =>
      _CatImageWithClickOptionsState();
}

class _CatImageWithClickOptionsState extends State<CatImageWithClickOptions> {
  late CatWithClickEntity catWithClickEntityUpdated;

  Future<void> _voteButtonOnPress(BuildContext context, String uid) async {
    var vote = await showDialog<Vote>(
      context: context,
      builder: (BuildContext context) => BlocProvider(
        create: (context) => PostVoteCubit(instance()),
        child: VoteDialog(
          catWithClickEntity: catWithClickEntityUpdated,
        ),
      ),
    );
    setState(() {
      catWithClickEntityUpdated =
          catWithClickEntityUpdated.copyWith(vote: vote);
    });
    if (context.mounted) {
      if (vote != null) {
        //not calling when we haven't vote or dismiss our dialog then (vote==null)
        //refresh our votes page after voting
        BlocProvider.of<VotesCubit>(context).getVotes(uid: uid, pageNum: 0);
      }
    }
  }

  void _analysisButtonOnPress(BuildContext context) {
    Navigator.pushNamed(context, Routes.analysisRoute);
  }

  @override
  void initState() {
    super.initState();
    catWithClickEntityUpdated = widget.catWithClickEntity;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: AppSize.s8,
      child: Column(
        children: [
          PlatformWidget(
              androidIos: (context) => CatPinchZoomImage(
                    imgUrl: catWithClickEntityUpdated.imageUrl,
                  ),
              web: (context) =>
                  CatNetworkImage(imgUrl: catWithClickEntityUpdated.imageUrl),
              desktop: (context) =>
                  CatCashedImage(imgUrl: catWithClickEntityUpdated.imageUrl)),
          _buildActionRow(context),
        ],
      ),
    );
  }

  Widget _buildActionRow(BuildContext context) {
    var uid = context.read<AuthCubit>().authObj!.uid;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        FavoriteButton(
          onPressed: () {},
          favorite: catWithClickEntityUpdated.favorite,
        ),
        Badge.count(
          textColor: Theme.of(context).scaffoldBackgroundColor,
          backgroundColor: ColorManager.green3,
          count: catWithClickEntityUpdated.vote?.value ?? 0,
          offset: LocalizationUtils.currentLocalIsAr()
              ? const Offset(-3, 10)
              : const Offset(3, 10),
          child: ActionButton(
            icon: Icons.how_to_vote_outlined,
            onPressed: () async {
              await _voteButtonOnPress(context, uid);
            },
          ),
        ),
        ActionButton(
          icon: Icons.science_outlined,
          onPressed: () {
            _analysisButtonOnPress(context);
          },
        ),
        const Spacer(),
        ActionButton(
          icon: Icons.save_alt,
          onPressed: () {},
        ),
      ],
    );
  }
}
