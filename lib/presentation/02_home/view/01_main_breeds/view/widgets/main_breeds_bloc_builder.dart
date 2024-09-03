import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'main_breeds_grid_builder.dart';
import '../../../../../01_login-register-forgotpass/view_model/auth_cubit/auth_cubit.dart';
import '../../../../../resources/values_manager.dart';
import '../../../widgets/states_widgets/error_state_widget.dart';
import '../../view_model/cubit/cat_breeds_cubit.dart';

class MainBreedsBlocBuilder extends StatefulWidget {
  final int columnNum;
  const MainBreedsBlocBuilder({
    super.key,
    required this.columnNum,
  });

  @override
  State<MainBreedsBlocBuilder> createState() => _MainBreedsBlocBuilderState();
}

class _MainBreedsBlocBuilderState extends State<MainBreedsBlocBuilder> {
  @override
  void initState() {
    //the authobj is coming from cashe or api
    BlocProvider.of<CatBreedsCubit>(context)
        .getBreeds(uid: BlocProvider.of<AuthCubit>(context).authObj!.uid);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CatBreedsCubit, CatBreedsState>(
      builder: (context, state) {
        if (state is CatBreedsFailure) {
          return SliverToBoxAdapter(
            child: SizedBox(
              /*
              so the refresh indicator can work.
              because the height can make it scrollable...
              */
              height: AppSize.s2000,
              child: Align(
                alignment: Alignment.topCenter,
                child: ErrorStateWidget(
                  errorText: state.errMessage,
                ),
              ),
            ),
          );
        } else {
          return SliverSkeletonizer(
            enabled: state.loading,
            child: SliverToBoxAdapter(
              child: MainBreedsGridBuilder(
                columnNumbers: widget.columnNum,
                items: state.breedsItems,
              ),
            ),
          );
        }
      },
    );
  }
}
