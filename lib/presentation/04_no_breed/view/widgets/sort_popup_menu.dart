import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../app/extensions.dart';
import '../../../01_login-register-forgotpass/view_model/auth_cubit/auth_cubit.dart';
import '../../../02_home/view_model/settings_cubit/settings_cubit.dart';
import '../../view_model/bloc/no_breed_bloc.dart';

class SortPopupMenu extends StatefulWidget {
  const SortPopupMenu({
    super.key,
  });

  @override
  SortPopupMenuState createState() => SortPopupMenuState();
}

class SortPopupMenuState extends State<SortPopupMenu> {
  SortingItem? selectedSortingItem = SortingItem.random;
  List<PopupMenuItem<SortingItem>> sortItems = [];

  @override
  void initState() {
    super.initState();
    _updateSortItems();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _updateSortItems();
  }

  void _updateSortItems() {
    sortItems = SortingItem.values.map((SortingItem sortingItem) {
      return PopupMenuItem<SortingItem>(
        value: sortingItem,
        child: BlocBuilder<SettingsCubit, SettingsState>(
          builder: (context, state) {
            return Text(
              sortingItem.displayValue,
            );
          },
        ),
      );
    }).toList();
  }

  void _onSortItemSelection(SortingItem value) {
    if (selectedSortingItem != value) {
      // save the sorting in the bloc
      BlocProvider.of<NoBreedBloc>(context).add(SortingEvent(value.apiValue));
      setState(() {
        selectedSortingItem = value;
      });
      var uid = context.read<AuthCubit>().authObj!.uid;
      //trigger the request here
      BlocProvider.of<NoBreedBloc>(context)
          .add(CategoryImagesEvent(uid: uid, pageNum: 0));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SettingsCubit, SettingsState>(
      listener: (context, state) {
        if (state is LocaleSuccess) {
          _updateSortItems();
        }
      },
      child: PopupMenuButton<SortingItem>(
        icon: const Icon(Icons.filter_alt_outlined),
        initialValue: selectedSortingItem,
        itemBuilder: (BuildContext context) => sortItems,
        onSelected: (SortingItem value) {
          _onSortItemSelection(value);
        },
      ),
    );
  }
}
