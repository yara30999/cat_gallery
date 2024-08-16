import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../app/extensions.dart';
import '../../../app/functions.dart';
import '../../../domain/entities/drawer_item_entity.dart';
import '../../../domain/entities/user_info_entity.dart';
import '../../../generated/l10n.dart';
import '../../01_login-register/view_model/cubit/auth_cubit.dart';
import '../../resources/color_manager.dart';
import '../../resources/routes_manager.dart';
import '../../resources/styles_manager.dart';
import '../../resources/values_manager.dart';
import 'app_developer.dart';
import 'active_inactive_drawer_item.dart';
import 'language_button.dart';
import 'theme_button.dart';
import 'user_info_list_tile.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key, required this.scaffoldKey});
  final GlobalKey<ScaffoldState> scaffoldKey;
  @override
  Widget build(BuildContext context) {
    return Material(
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
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    minHeight: AppSize.s60,
                  ),
                  child: Center(
                    child: SafeArea(
                      child: Text(
                        S.current.cat_gallery,
                        style: Styles.style36Medium()
                            .copyWith(color: ColorManager.white),
                      ),
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
            const SliverToBoxAdapter(
              child: SizedBox(
                height: AppSize.s10,
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
                  BlocListener<AuthCubit, AuthState>(
                    listener: (context, state) {
                      if (state is LogoutLoading) {
                        scaffoldKey.currentState?.closeDrawer();
                      } else if (state is LogoutSuccess) {
                        Navigator.pushReplacementNamed(
                            context, Routes.loginRoute);
                      } else if (state is LogoutFailure) {
                        showSnakBar(context, state.errMessage);
                      }
                    },
                    child: InkWell(
                      onTap: () {
                        BlocProvider.of<AuthCubit>(context).logout();
                      },
                      mouseCursor: SystemMouseCursors.click,
                      child: ActiveDrawerItem(
                        drawerItemEntity: DrawerItemEntity(
                            title: S.current.Logout_account,
                            icon: Icons.exit_to_app_outlined),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: AppSize.s28,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
