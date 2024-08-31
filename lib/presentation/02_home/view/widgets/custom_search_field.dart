import 'package:flutter/material.dart';
import '../../../../generated/l10n.dart';
import '../../../resources/styles_manager.dart';
import '../../../resources/values_manager.dart';

class CustomSearchField extends StatefulWidget {
  const CustomSearchField({
    super.key,
  });

  @override
  State<CustomSearchField> createState() => _CustomSearchFieldState();
}

class _CustomSearchFieldState extends State<CustomSearchField> {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    searchController.dispose();
    super.dispose();
  }

  void _clearSearch() {
    searchController.clear();
    _focusNode.unfocus();
    setState(() {
      searchController;
    });
  }

  void _searchValue(String value) {
    //print('search field value : $value');
    setState(() {
      searchController;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchController,
      focusNode: _focusNode,
      keyboardType: TextInputType.text,
      onChanged: (value) {
        _searchValue(value);
      },
      style: Styles.style18Medium(),
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: AppSize.s20),
          hintText: S.current.Search_by_breed_name,
          hintStyle: Styles.style18Medium(),
          suffixIcon: searchController.value.text.isEmpty
              ? Icon(
                  Icons.search,
                  color: Theme.of(context).primaryColorDark,
                )
              : GestureDetector(
                  onTap: () {
                    _clearSearch();
                  },
                  child: Icon(
                    Icons.close,
                    color: Theme.of(context).primaryColorDark,
                  ),
                )),
    );
  }
}
