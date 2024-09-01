import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import '../../../02_home/view/widgets/states_widgets/error_state_widget.dart';
import '../../../resources/assets_manager.dart';
import '../../../resources/values_manager.dart';
import '../../view_model/cubit/specific_breed_cubit.dart';
import '../widgets/information_desktop_body.dart';

class SpecificBreedInfoDesktopBlocBuilder extends StatelessWidget {
  const SpecificBreedInfoDesktopBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpecificBreedCubit, SpecificBreedState>(
      builder: (context, state) {
        if (state is SpecificBreedFailure) {
          return SizedBox(
            height: AppSize.s440,
            child: ErrorStateWidget(
              errorText: state.errMessage,
            ),
          );
        } else if (state is SpecificBreedSuccess) {
          return InformationDesktopBody(
            catBreedEntity: state.catBreedEntity,
          );
        } else {
          return SizedBox(
            height: AppSize.s440,
            child: Lottie.asset(JsonAssets.loading2, fit: BoxFit.contain),
          );
        }
      },
    );
  }
}
