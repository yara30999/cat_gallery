import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/category_item.dart';
import '../../01_login-register-forgotpass/view_model/auth_cubit/auth_cubit.dart';
import '../../02_home/view/widgets/persistenet_header.dart';
import '../../resources/language_manager.dart';
import '../../resources/styles_manager.dart';
import '../../resources/values_manager.dart';
import '../view_model/bloc/no_breed_bloc.dart';
import 'bloc_builder/no_breed_bloc_consumer.dart';
import 'widgets/category_item.dart';
import 'widgets/no_breed_header.dart';

class NoBreedBodyDesktop extends StatelessWidget {
  const NoBreedBodyDesktop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: ImagesBody(),
        ),
        CategoryBody(),
      ],
    );
  }
}

class ImagesBody extends StatelessWidget {
  const ImagesBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const PersistentHeader(),
        SliverPadding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppPadding.p60, vertical: 0),
          sliver: SliverToBoxAdapter(
            child: NoBreedHeader(
              headerStyle: Styles.style36Medium(),
            ),
          ),
        ),
        const SliverPadding(
          padding: EdgeInsets.symmetric(
            horizontal: AppPadding.p200,
            vertical: AppPadding.p20,
          ),
          sliver: NoBreedBlocConsumer(),
        ),
      ],
    );
  }
}

class CategoryBody extends StatefulWidget {
  const CategoryBody({super.key});

  @override
  State<CategoryBody> createState() => _CategoryBodyState();
}

class _CategoryBodyState extends State<CategoryBody> {
  int activeIndex = 0;

  void _onCategorySelection(int index) {
    if (activeIndex != index) {
      //save the category index to the bloc
      BlocProvider.of<NoBreedBloc>(context).add(CategoryEvent(index));
      setState(() {
        activeIndex = index;
      });
      var uid = context.read<AuthCubit>().authObj!.uid;
      //trigger the request here
      BlocProvider.of<NoBreedBloc>(context)
          .add(CategoryImagesEvent(uid: uid, pageNum: 0));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: AppSize.s15,
      child: SizedBox(
        height: double.infinity,
        width: AppSize.s160,
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: EdgeInsets.only(
                top: AppPadding.p10,
                right:
                    LocalizationUtils.currentLocalIsAr() ? AppPadding.p10 : 0.0,
                left:
                    LocalizationUtils.currentLocalIsAr() ? 0.0 : AppPadding.p10,
              ),
              sliver: SliverList.builder(
                  itemCount: CategoryItemEntity.items.length,
                  itemBuilder: (buildContext, index) {
                    return GestureDetector(
                      onTap: () {
                        _onCategorySelection(index);
                      },
                      child: Align(
                        alignment: LocalizationUtils.currentLocalIsAr()
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: SizedBox(
                          height: AppSize.s50,
                          child: CategoryItem(
                            isActive: activeIndex == index,
                            categoryItemEntity: CategoryItemEntity.items[index],
                          ),
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
