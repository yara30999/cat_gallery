import 'package:flutter/material.dart';
import '../../../../domain/entities/cat_breed_card.dart';
import '../../../../generated/l10n.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/styles_manager.dart';
import '../../../resources/values_manager.dart';
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
    final breed = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return BreedAlertDialog(
          breedList: breeds,
        );
      },
    );

    setState(() {
      _selectedBreed = breed;
    });
  }

  @override
  void initState() {
    super.initState();
    // TODO: 1 we should get the actual breed list from the api...
    // we need only breed id and name...
    breeds = const [
      CatBreedCardEntity(
        breedId: 'abys',
        breedName: 'Abyssinian',
        referenceImgId: '',
        referenceImgurl: '',
      ),
      CatBreedCardEntity(
        breedId: 'aege',
        breedName: 'Aegean',
        referenceImgId: '',
        referenceImgurl: '',
      ),
      CatBreedCardEntity(
        breedId: 'abob',
        breedName: 'American Bobtail',
        referenceImgId: '',
        referenceImgurl: '',
      ),
      CatBreedCardEntity(
        breedId: 'acur',
        breedName: 'American Curl',
        referenceImgId: '',
        referenceImgurl: '',
      ),
      CatBreedCardEntity(
        breedId: 'asho',
        breedName: 'American Shorthair',
        referenceImgId: '',
        referenceImgurl: '',
      ),
    ];
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
