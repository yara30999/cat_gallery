import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import '../widgets/specific_breed_header_mobile.dart';
import '../../../02_home/view/widgets/states_widgets/error_state_widget.dart';
import '../../../resources/assets_manager.dart';
import '../../../resources/values_manager.dart';
import '../../view_model/cubit/specific_breed_cubit.dart';

class SpecificBreedHeaderMobileBlocBuilder extends StatelessWidget {
  const SpecificBreedHeaderMobileBlocBuilder({super.key});

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
          return SpecificBreedHeaderMobile(
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
