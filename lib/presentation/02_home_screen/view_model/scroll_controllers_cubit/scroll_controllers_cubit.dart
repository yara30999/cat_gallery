import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomScrollControllersCubit
    extends Cubit<Map<String, ScrollController>> {
  BottomScrollControllersCubit()
      : super({
          'bottomScrollController': ScrollController(),
        });

  ScrollController get bottomScrollController =>
      state['bottomScrollController']!;

  void disposeControllers() {
    // if there is more controllers
    // state.forEach((key, controller) {
    //   controller.dispose();
    // });
    final controller = state['bottomScrollController'];
    if (controller != null) {
      controller.dispose();
    }
  }
}
