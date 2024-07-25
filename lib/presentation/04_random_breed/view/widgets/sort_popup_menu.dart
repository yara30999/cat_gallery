import 'package:flutter/material.dart';
import '../../../../app/extensions.dart';

class SortPopupMenu extends StatefulWidget {
  const SortPopupMenu({
    super.key,
  });

  @override
  SortPopupMenuState createState() => SortPopupMenuState();
}

class SortPopupMenuState extends State<SortPopupMenu> {
  SortingItem? selectedSortingItem = SortingItem.asc;
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
        child: Text(
          sortingItem.displayValue,
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<SortingItem>(
      icon: const Icon(Icons.filter_alt_outlined),
      initialValue: selectedSortingItem,
      itemBuilder: (BuildContext context) => sortItems,
      onSelected: (SortingItem value) {
        setState(() {
          selectedSortingItem = value;
        });
      },
    );
  }
}
