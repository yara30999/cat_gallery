import 'package:flutter/material.dart';
import '../../app/extensions.dart';
import '../../domain/entities/drawer_item_entity.dart';
import '../../domain/entities/user_info_entity.dart';
import '../../generated/l10n.dart';
import '../resources/color_manager.dart';
import '../resources/routes_manager.dart';
import '../resources/styles_manager.dart';
import '../resources/values_manager.dart';
import 'widgets/active_inactive_drawer_item.dart';
import 'widgets/app_developer.dart';
import 'widgets/drawer_item.dart';
import 'widgets/language_button.dart';
import 'widgets/theme_button.dart';
import 'widgets/user_info_list_tile.dart';

class HomeViewDesktop extends StatefulWidget {
  const HomeViewDesktop({
    super.key,
  });

  @override
  State<HomeViewDesktop> createState() => _HomeViewDesktopState();
}

class _HomeViewDesktopState extends State<HomeViewDesktop> {
  int _currentPage = 0;

  List<DrawerItemEntity> get items => [
        DrawerItemEntity(title: S.current.Home, icon: Icons.home),
        DrawerItemEntity(title: S.current.Favorites, icon: Icons.favorite),
        DrawerItemEntity(
            title: S.current.Uploads, icon: Icons.drive_folder_upload),
        DrawerItemEntity(
            title: S.current.Votes, icon: Icons.how_to_vote_outlined),
      ];
  void onTabTapped(int index) {
    if (_currentPage != index) {
      setState(() {
        _currentPage = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //extendBody: true,
      body: Row(
        children: [
          //web drawer ..................................
          Expanded(
            flex: 1,
            child: Material(
              elevation: AppSize.s15,
              color: Theme.of(context).scaffoldBackgroundColor,
              child: SizedBox(
                height: double.infinity,
                width: MediaQuery.sizeOf(context).width * .7,
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Material(
                        color: Theme.of(context).primaryColor,
                        child: SizedBox(
                          height: AppSize.s60,
                          width: double.infinity,
                          child: Center(
                            child: Text(
                              S.current.cat_gallery,
                              style: Styles.style36Medium()
                                  .copyWith(color: ColorManager.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SliverToBoxAdapter(
                      child: UserInfoListTile(
                        userInfoEntity: UserInfoEntity(
                            gender: Gender.male,
                            name: 'Lekan Okeowo',
                            email: 'demo@gmail.com'),
                      ),
                    ),
                    SliverList.builder(
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            onTabTapped(index);
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: AppPadding.p10),
                            child: DrawerItem(
                              drawerItemEntity: items[index],
                              isActive: _currentPage == index,
                            ),
                          ),
                        );
                      },
                    ),
                    const SliverToBoxAdapter(
                      child: Divider(
                        color: ColorManager.grey2,
                      ),
                    ),
                    const SliverToBoxAdapter(child: ThemeButton()),
                    const SliverToBoxAdapter(
                      child: Divider(
                        color: ColorManager.grey2,
                      ),
                    ),
                    const SliverToBoxAdapter(child: LanguageButton()),
                    SliverFillRemaining(
                      hasScrollBody: false,
                      child: Column(
                        children: [
                          const Expanded(
                              child: SizedBox(
                            height: AppSize.s10,
                          )),
                          const Divider(
                            color: ColorManager.grey2,
                          ),
                          const AppDeveloper(),
                          const SizedBox(
                            height: AppSize.s5,
                          ),
                          ActiveDrawerItem(
                            drawerItemEntity: DrawerItemEntity(
                                title: S.current.Logout_account,
                                icon: Icons.exit_to_app_outlined),
                          ),
                          const SizedBox(
                            height: AppSize.s15,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // web pages ..................................
          Expanded(
            flex: 5,
            child: IndexedStack(
              index: _currentPage,
              children: const [
                MainBreedsNavigator(
                  scrollController: null,
                ),
                FavoritesNavigator(
                  scrollController: null,
                ),
                UploadsNavigator(
                  scrollController: null,
                ),
                VotesNavigator(
                  scrollController: null,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
