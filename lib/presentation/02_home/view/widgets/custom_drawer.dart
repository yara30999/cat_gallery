import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../domain/entities/user_info_entity.dart';
import '../../../../generated/l10n.dart';
import '../../../01_login-register-forgotpass/view_model/auth_cubit/auth_cubit.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/styles_manager.dart';
import '../../../resources/values_manager.dart';
import 'app_developer.dart';
import 'language_button.dart';
import 'logout_button_bloc_consumer.dart';
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
            SliverToBoxAdapter(
              child: UserInfoListTile(
                userInfoEntity: UserInfoEntity(
                  name: BlocProvider.of<AuthCubit>(context).authObj!.name,
                  email: BlocProvider.of<AuthCubit>(context).authObj!.email,
                ),
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
