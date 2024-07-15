// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AnalysisBody extends StatefulWidget {
  final ScrollController? analysisScreenScrollController;
  const AnalysisBody({
    super.key,
    required this.analysisScreenScrollController,
  });

  @override
  State<AnalysisBody> createState() => _AnalysisBodyState();
}

class _AnalysisBodyState extends State<AnalysisBody> {
  @override
  void dispose() {
    widget.analysisScreenScrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
