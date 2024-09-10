import 'package:flutter/material.dart';
import '../../../../domain/entities/cat_breed_card.dart';
import '../../../../generated/l10n.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/styles_manager.dart';
import '../../../resources/values_manager.dart';

class BreedAlertDialog extends StatelessWidget {
  final List<CatBreedCardEntity> breedList;
  const BreedAlertDialog({
    super.key,
    required this.breedList,
  });

  void _breedOnPress(
      BuildContext context, CatBreedCardEntity categoryItemEntity) {
    Navigator.of(context).pop(categoryItemEntity);
  }

  void _noBreedOnPress(
    BuildContext context,
  ) {
    Navigator.of(context).pop(null);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      title: Text(
        S.current.select_breed,
        style: Styles.style24Medium()
            .copyWith(color: Theme.of(context).primaryColor),
      ),
      actions: [
        InkWell(
          mouseCursor: SystemMouseCursors.click,
          onTap: () {
            _noBreedOnPress(context);
          },
          child: Text(
            S.current.do_not_know_breed,
            style: Styles.style18Medium().copyWith(color: ColorManager.red),
          ),
        ),
      ],
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(
          breedList.length,
          (index) {
            return ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: AppSize.s400),
              child: Card(
                child: ListTile(
                  leading: Text(
                    '${index + 1}',
                    style: Styles.style18Medium(),
                  ),
                  title: Text(
                    breedList[index].breedName,
                    style: Styles.style18Medium(),
                  ),
                  onTap: () {
                    _breedOnPress(context, breedList[index]);
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
