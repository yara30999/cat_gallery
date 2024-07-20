import 'package:flutter/material.dart';
import '../../../../../generated/l10n.dart';
import '../../../../resources/styles_manager.dart';
import '../../../../resources/values_manager.dart';
import '../../../widgets/custom_search_field.dart';
import 'paragraph_with_click.dart';

class MainBreedsHeaderTablet extends StatelessWidget {
  const MainBreedsHeaderTablet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: AppSize.s10,
        ),
        Text(
          S.current.main_breeds,
          style: Styles.style22Medium(),
        ),
        const CustomSearchField(),
        const SizedBox(
          height: AppSize.s10,
        ),
        const ParagraphStartsWithClickText(),
      ],
    );
  }
}
