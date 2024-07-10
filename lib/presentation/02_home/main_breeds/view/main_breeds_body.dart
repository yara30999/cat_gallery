import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../../../app/functions.dart';
import '../../../../domain/entities/cat_breed_card.dart';
import '../../../../generated/l10n.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/routes_manager.dart';
import '../../../resources/styles_manager.dart';
import '../../../resources/values_manager.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_search_field.dart';

class MainBreedsBody extends StatefulWidget {
  final ScrollController mainBreedsScreenScrollController;
  const MainBreedsBody({
    super.key,
    required this.mainBreedsScreenScrollController,
  });

  @override
  State<MainBreedsBody> createState() => _MainBreedsBodyState();
}

class _MainBreedsBodyState extends State<MainBreedsBody> {
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: widget.mainBreedsScreenScrollController,
      slivers: [
        const PersistentAppBar(),
        SliverPadding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.p16,
          ),
          sliver: SliverToBoxAdapter(
            child: MainBreedsHeader(searchController: searchController),
          ),
        ),
        const SliverPadding(
          padding: EdgeInsets.symmetric(
            horizontal: AppPadding.p16,
            vertical: AppPadding.p20,
          ),
          sliver: MainBreedsGridBuilder(),
        ),
      ],
    );
  }
}

class MainBreedsHeader extends StatelessWidget {
  const MainBreedsHeader({
    super.key,
    required this.searchController,
  });

  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: AppSize.s10,
        ),
        Text(
          S.current.main_breeds,
          style: Styles.style36Medium(),
        ),
        CustomSearchField(searchController: searchController),
        const SizedBox(
          height: AppSize.s10,
        ),
        const ParagraphStartsWithClickText(),
      ],
    );
  }
}

class MainBreedsGridBuilder extends StatelessWidget {
  const MainBreedsGridBuilder({
    super.key,
  });
  // instead of doing (static final List<CatBreedCardInfo> items = [];)
  List<CatBreedCardEntity> get items => [
        const CatBreedCardEntity(
            breedId: '',
            breedName: 'Footstool',
            referenceImgId: '',
            referenceImgurl: 'assets/images/cat_1.png'),
        const CatBreedCardEntity(
            breedId: '',
            breedName: 'Modern dresser',
            referenceImgId: '',
            referenceImgurl: 'assets/images/cat_2.png'),
        const CatBreedCardEntity(
            breedId: '',
            breedName: 'Bedside cupboard',
            referenceImgId: '',
            referenceImgurl: 'assets/images/cat_3.png'),
        const CatBreedCardEntity(
            breedId: '',
            breedName: 'Bedside cupboard',
            referenceImgId: '',
            referenceImgurl: 'assets/images/cat_4.png'),
        const CatBreedCardEntity(
            breedId: '',
            breedName: 'Bedside cupboard',
            referenceImgId: '',
            referenceImgurl: 'assets/images/cat_5.png'),
        const CatBreedCardEntity(
            breedId: '',
            breedName: 'Footstool',
            referenceImgId: '',
            referenceImgurl: 'assets/images/cat_6.png'),
        const CatBreedCardEntity(
            breedId: '',
            breedName: 'Footstool',
            referenceImgId: '',
            referenceImgurl: 'assets/images/cat_7.png'),
        const CatBreedCardEntity(
            breedId: '',
            breedName: 'Bedside cupboard',
            referenceImgId: '',
            referenceImgurl: 'assets/images/cat_8.png'),
        const CatBreedCardEntity(
            breedId: '',
            breedName: 'Footstool',
            referenceImgId: '',
            referenceImgurl: 'assets/images/cat_9.png'),
        const CatBreedCardEntity(
            breedId: '',
            breedName: 'Footstool',
            referenceImgId: '',
            referenceImgurl: 'assets/images/cat_10.png'),
        const CatBreedCardEntity(
            breedId: '',
            breedName: 'Footstool',
            referenceImgId: '',
            referenceImgurl: 'assets/images/cat_1.png'),
        const CatBreedCardEntity(
            breedId: '',
            breedName: 'Modern dresser',
            referenceImgId: '',
            referenceImgurl: 'assets/images/cat_2.png'),
        const CatBreedCardEntity(
            breedId: '',
            breedName: 'Bedside cupboard',
            referenceImgId: '',
            referenceImgurl: 'assets/images/cat_3.png'),
        const CatBreedCardEntity(
            breedId: '',
            breedName: 'Bedside cupboard',
            referenceImgId: '',
            referenceImgurl: 'assets/images/cat_4.png'),
        const CatBreedCardEntity(
            breedId: '',
            breedName: 'Bedside cupboard',
            referenceImgId: '',
            referenceImgurl: 'assets/images/cat_5.png'),
        const CatBreedCardEntity(
            breedId: '',
            breedName: 'Footstool',
            referenceImgId: '',
            referenceImgurl: 'assets/images/cat_6.png'),
        const CatBreedCardEntity(
            breedId: '',
            breedName: 'Footstool',
            referenceImgId: '',
            referenceImgurl: 'assets/images/cat_7.png'),
        const CatBreedCardEntity(
            breedId: '',
            breedName: 'Bedside cupboard',
            referenceImgId: '',
            referenceImgurl: 'assets/images/cat_8.png'),
        const CatBreedCardEntity(
            breedId: '',
            breedName: 'Footstool',
            referenceImgId: '',
            referenceImgurl: 'assets/images/cat_9.png'),
        const CatBreedCardEntity(
            breedId: '',
            breedName: 'Footstool',
            referenceImgId: '',
            referenceImgurl: 'assets/images/cat_10.png'),
      ];

  @override
  Widget build(BuildContext context) {
    return SliverMasonryGrid.count(
      childCount: items.length,
      mainAxisSpacing: AppPadding.p20,
      crossAxisSpacing: AppPadding.p10,
      crossAxisCount: 2,
      itemBuilder: (context, index) {
        return CatBreedNavigationItem(
          catBreedCard: items[index],
        );
      },
    );
  }
}

class CatBreedNavigationItem extends StatelessWidget {
  final CatBreedCardEntity catBreedCard;

  const CatBreedNavigationItem({
    super.key,
    required this.catBreedCard,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          Routes.specificBreedRoute,
        );
      },
      child: Material(
        elevation: AppSize.s8,
        borderRadius: BorderRadius.circular(AppSize.s28),
        clipBehavior: Clip.antiAlias,
        color: Theme.of(context).disabledColor,
        child: Column(
          children: [
            Image.asset(
              catBreedCard.referenceImgurl,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(catBreedCard.breedName,
                  textAlign: TextAlign.center,
                  style:
                      Styles.style18Bold().copyWith(color: ColorManager.white)),
            ),
          ],
        ),
      ),
    );
  }
}

class ParagraphStartsWithClickText extends StatelessWidget {
  const ParagraphStartsWithClickText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TextStyle baseTextStyle = Styles.style18Medium().copyWith(
        color: isLightTheme(context) ? ColorManager.black : ColorManager.white);
    return RichText(
        text: TextSpan(style: baseTextStyle, children: [
      TextSpan(
        text: S.current.Browse_random_images_of_all_breeds,
        style: baseTextStyle.copyWith(
          color: ColorManager.blue,
          decoration: TextDecoration.underline,
          decorationColor: ColorManager.blue, // Custom underline color
          decorationStyle: TextDecorationStyle.solid,
          decorationThickness: AppSize.s2,
        ),
        recognizer: TapGestureRecognizer()
          ..onTap = () {
            Navigator.pushNamed(
              context,
              Routes.randomBreedRoute,
            );
          },
      ),
      TextSpan(
        text: S.current.main_breed_paragraph,
      ),
    ]));
  }
}
