import 'package:flutter/material.dart';
import '../../../domain/entities/cat_with_click_entity.dart';
import '../../resources/color_manager.dart';
import '../../resources/styles_manager.dart';
import '../../resources/values_manager.dart';

class VoteSelectorButton extends StatefulWidget {
  final Vote? vote;
  const VoteSelectorButton({
    super.key,
    required this.vote,
  });

  @override
  VoteSelectorButtonState createState() => VoteSelectorButtonState();
}

class VoteSelectorButtonState extends State<VoteSelectorButton> {
  late int _voteValue = 0;
  @override
  void initState() {
    super.initState();
    _voteValue = widget.vote == null ? 0 : widget.vote!.value;
  }

  void _incrementQuantity() {
    setState(() {
      if (_voteValue < 10) {
        _voteValue++;
      }
    });
  }

  void _decrementQuantity() {
    setState(() {
      if (_voteValue > -10) {
        _voteValue--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).disabledColor,
      elevation: AppSize.s8,
      borderRadius: BorderRadius.circular(30),
      textStyle: Styles.style20Regular().copyWith(color: ColorManager.white),
      child: Row(
        textDirection: TextDirection.ltr,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          IconButton(
            icon: const Icon(Icons.remove),
            onPressed: _decrementQuantity,
          ),
          Text(
            '$_voteValue',
          ),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _incrementQuantity,
          ),
        ],
      ),
    );
  }
}
