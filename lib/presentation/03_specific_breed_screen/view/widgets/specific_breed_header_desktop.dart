import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../generated/l10n.dart';
import '../../../resources/conistants_manager.dart';
import '../../../resources/styles_manager.dart';
import '../../view_model/breed/specific_breed_cubit.dart';

class SpecificBreedHeaderDesktop extends StatelessWidget {
  const SpecificBreedHeaderDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            S.current.breed_cat_images(
                context.read<SpecificBreedCubit>().breedName ??
                    AppConstants.empty),
            style: Styles.style36Medium(),
          ),
        ),
      ],
    );
  }
}
