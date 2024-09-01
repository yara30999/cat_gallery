import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../generated/l10n.dart';
import '../../../resources/styles_manager.dart';
import '../../../resources/values_manager.dart';
import '../01_main_breeds/view_model/cubit/cat_breeds_cubit.dart';

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
    // Reset search when cleared
    context.read<CatBreedsCubit>().searchBreeds('');
  }

  void _searchValue(String value) {
    setState(() {
      searchController;
    });
    // Perform search with each keystroke
    context.read<CatBreedsCubit>().searchBreeds(value);
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
