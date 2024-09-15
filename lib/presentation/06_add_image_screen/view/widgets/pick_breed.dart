import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../domain/entities/cat_breed_card.dart';
import '../../../../generated/l10n.dart';
import '../../../02_home_screen/view_model/settings_cubit/settings_cubit.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/styles_manager.dart';
import '../../../resources/values_manager.dart';
import '../../view_model/cubit/upload_image_cubit.dart';
import 'alert_dialog_breed.dart';

class PickBreed extends StatefulWidget {
  final List<CatBreedCardEntity> breeds;
  const PickBreed({
    super.key,
    required this.breeds,
  });

  @override
  State<PickBreed> createState() => _PickBreedState();
}

class _PickBreedState extends State<PickBreed> {
  String? _selectedBreed;

  void _openBreedPicker(BuildContext context) async {
    final catBreedCardEntity = await showDialog<CatBreedCardEntity>(
      context: context,
      builder: (BuildContext context) {
        return BreedAlertDialog(
          breedList: widget.breeds,
        );
      },
    );

    setState(() {
      _selectedBreed = catBreedCardEntity?.breedName;
    });
    if (context.mounted) {
      BlocProvider.of<UploadImageCubit>(context).breedId =
          catBreedCardEntity?.breedId;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: AppSize.s14,
      children: [
        BlocBuilder<SettingsCubit, SettingsState>(
          builder: (context, state) {
            return Text(
              S.current.Optional,
              style: Styles.style16Medium().copyWith(color: ColorManager.red),
            );
          },
        ),
        InkWell(
          mouseCursor: SystemMouseCursors.click,
          onTap: () => _openBreedPicker(context),
          child: BlocBuilder<SettingsCubit, SettingsState>(
            builder: (context, state) {
              return Text(
                S.current.selected_breed(_selectedBreed ?? S.current.nothing),
                style: Styles.style16Medium().copyWith(
                  color: _selectedBreed == null
                      ? ColorManager.blue
                      : ColorManager.green1,
                  decoration:
                      _selectedBreed == null ? TextDecoration.underline : null,
                  decorationColor: ColorManager.blue,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
