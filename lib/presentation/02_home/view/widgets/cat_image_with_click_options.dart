import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../app/di.dart';
import '../../../../domain/entities/cat_with_click_entity.dart';
import '../../../01_login-register-forgotpass/view_model/auth_cubit/auth_cubit.dart';
import '../../../05_analysis_screen/view_model/cubit/analysis_cubit.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/language_manager.dart';
import '../../../resources/platform_manager.dart';
import '../../../resources/routes_manager.dart';
import '../../view_model/download_cubit/download_image_cubit.dart';
import '../../view_model/share_cubit/share_image_cubit.dart';
import '../02_favorites/view_model/add_del_favourite_cubit/like_unlike_cubit.dart';
import '../04_votes/view_model/add_vote_cubit/post_vote_cubit.dart';
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

  @override
  void initState() {
    super.initState();
    catWithClickEntityUpdated = widget.catWithClickEntity;
  }

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
  }

  void _analysisButtonOnPress(BuildContext context, String uid) {
    BlocProvider.of<AnalysisCubit>(context).imgUrl =
        catWithClickEntityUpdated.imageUrl;
    BlocProvider.of<AnalysisCubit>(context).uid = uid;
    BlocProvider.of<AnalysisCubit>(context).imgId =
        catWithClickEntityUpdated.imageId;
    BlocProvider.of<AnalysisCubit>(context).getImageAnalysis();
    Navigator.pushNamed(context, Routes.analysisRoute);
  }

  void _download() {
    BlocProvider.of<DownloadImageCubit>(context)
        .download(catWithClickEntity: catWithClickEntityUpdated);
  }

  void _share() async {
    BlocProvider.of<ShareImageCubit>(context)
        .share(catWithClickEntity: catWithClickEntityUpdated);
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
        BlocListener<LikeUnlikeCubit, LikeUnlikeState>(
          listener: (context, state) async {
            if (state is LikeUnlikeSuccess) {
              //note: never call an api here, it is calling a handred times
              setState(() {
                catWithClickEntityUpdated = catWithClickEntityUpdated.copyWith(
                    favorite: state.favouriteData);
              });
            }
          },
          child: FavoriteButton(
            catWithClickEntity: catWithClickEntityUpdated,
          ),
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
            _analysisButtonOnPress(context, uid);
          },
        ),
        const Spacer(),
        if (!isDesktop())
          ActionButton(
            icon: Icons.save_alt,
            onPressed: () {
              _download();
            },
          ),
        if (!isWebOrDesktopApp())
          ActionButton(
            icon: Icons.share,
            onPressed: () {
              _share();
            },
          ),
      ],
    );
  }
}
