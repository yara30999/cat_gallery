import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/drawer_item_entity.dart';
import '../../../domain/entities/user_info_entity.dart';
import '../../../generated/l10n.dart';
import '../../01_login-register-forgotpass/view_model/auth_cubit/auth_cubit.dart';
import '../../resources/color_manager.dart';
import '../../resources/routes_manager.dart';
import '../../resources/styles_manager.dart';
import '../../resources/values_manager.dart';
import 'widgets/app_developer.dart';
import 'widgets/drawer_item.dart';
import 'widgets/language_button.dart';
import 'widgets/logout_button_bloc_consumer.dart';
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
      body: SafeArea(
        child: Row(
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
                      SliverToBoxAdapter(
                        child: UserInfoListTile(
                          userInfoEntity: UserInfoEntity(
                            name: BlocProvider.of<AuthCubit>(context)
                                .authObj!
                                .name,
                            email: BlocProvider.of<AuthCubit>(context)
                                .authObj!
                                .email,
                          ),
                        ),
                      ),
                      SliverList.builder(
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(top: AppPadding.p10),
                            child: InkWell(
                              mouseCursor: SystemMouseCursors.click,
                              onTap: () {
                                onTabTapped(index);
                              },
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
                      const SliverFillRemaining(
                        hasScrollBody: false,
                        child: Column(
                          children: [
                            Expanded(
                                child: SizedBox(
                              height: AppSize.s10,
                            )),
                            Divider(
                              color: ColorManager.grey2,
                            ),
                            AppDeveloper(),
                            SizedBox(
                              height: AppSize.s5,
                            ),
                            LogoutButtonBlocConsumer(),
                            SizedBox(
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
                  MainBreedsNavigator(),
                  FavoritesNavigator(),
                  UploadsNavigator(),
                  VotesNavigator(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
