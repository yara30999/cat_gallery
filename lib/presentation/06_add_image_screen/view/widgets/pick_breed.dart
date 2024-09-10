import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../domain/entities/cat_breed_card.dart';
import '../../../../generated/l10n.dart';
import '../../../02_home/view/01_main_breeds/view_model/cubit/cat_breeds_cubit.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/styles_manager.dart';
import '../../../resources/values_manager.dart';
import '../../view_model/cubit/upload_image_cubit.dart';
import 'alert_dialog_breed.dart';

class PickBreed extends StatefulWidget {
  const PickBreed({super.key});

  @override
  State<PickBreed> createState() => _PickBreedState();
}

class _PickBreedState extends State<PickBreed> {
  String? _selectedBreed;
  late List<CatBreedCardEntity> breeds;

  void _openBreedPicker(BuildContext context) async {
    final catBreedCardEntity = await showDialog<CatBreedCardEntity>(
      context: context,
      builder: (BuildContext context) {
        return BreedAlertDialog(
          breedList: breeds,
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
  void initState() {
    super.initState();
    // we need only breed id and name...
    breeds = BlocProvider.of<CatBreedsCubit>(context).catBreedsList;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: AppSize.s14,
      children: [
        Text(
          S.current.Optional,
          style: Styles.style16Medium().copyWith(color: ColorManager.red),
        ),
        InkWell(
          mouseCursor: SystemMouseCursors.click,
          onTap: () => _openBreedPicker(context),
          child: Text(
            S.current.selected_breed(_selectedBreed ?? S.current.nothing),
            style: Styles.style16Medium().copyWith(
              color: _selectedBreed == null
                  ? ColorManager.blue
                  : ColorManager.green1,
              decoration:
                  _selectedBreed == null ? TextDecoration.underline : null,
              decorationColor: ColorManager.blue,
            ),
          ),
        ),
      ],
    );
  }
}
