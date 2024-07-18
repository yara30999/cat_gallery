import 'dart:math';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../../../../domain/entities/cat_breed_entity.dart';
import '../../../../domain/entities/measurement_data_entity.dart';
import '../../../../generated/l10n.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/language_manager.dart';
import '../../../resources/styles_manager.dart';
import '../../../resources/values_manager.dart';

class SpecificBreedBarGraph extends StatefulWidget {
  final CatBreedEntity catBreedEntity;
  const SpecificBreedBarGraph({
    super.key,
    required this.catBreedEntity,
  });

  @override
  SpecificBreedBarGraphState createState() => SpecificBreedBarGraphState();
}

class SpecificBreedBarGraphState extends State<SpecificBreedBarGraph> {
  late MeasurementDataEntity myMeasurementData;
  late bool isRightLabelsShown;
  late bool isLeftLabelsShown;

  List<String> get yAxisLabels => [
        S.current.zero,
        S.current.one,
        S.current.two,
        S.current.three,
        S.current.four,
        S.current.five
      ];

  TextStyle get labelsStyle => Styles.style18Medium();

  @override
  void initState() {
    super.initState();
    myMeasurementData = initializeMeasurementData();
    isRightLabelsShown = LocalizationUtils.currentLocalIsAr();
    isLeftLabelsShown = !LocalizationUtils.currentLocalIsAr();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setState(() {
      isRightLabelsShown = LocalizationUtils.currentLocalIsAr();
      isLeftLabelsShown = !LocalizationUtils.currentLocalIsAr();
    });
  }

  MeasurementDataEntity initializeMeasurementData() {
    return MeasurementDataEntity(
      adaptability: widget.catBreedEntity.adaptability,
      healthIssues: widget.catBreedEntity.healthIssues,
      childFriendly: widget.catBreedEntity.childFriendly,
      dogFriendly: widget.catBreedEntity.dogFriendly,
      strangerFriendly: widget.catBreedEntity.strangerFriendly,
      sheddingLevel: widget.catBreedEntity.sheddingLevel,
      affectionLevel: widget.catBreedEntity.affectionLevel,
      energyLevel: widget.catBreedEntity.energyLevel,
      grooming: widget.catBreedEntity.grooming,
      intelligence: widget.catBreedEntity.intelligence,
      socialNeeds: widget.catBreedEntity.socialNeeds,
    );
  }

  @override
  Widget build(BuildContext context) {
    //to ensure rebuild when the locals changed
    isRightLabelsShown = LocalizationUtils.currentLocalIsAr();
    isLeftLabelsShown = !LocalizationUtils.currentLocalIsAr();
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSize.s26),
        child: AspectRatio(
          aspectRatio: 1 / 1.5,
          child: RotatedBox(
            quarterTurns: LocalizationUtils.currentLocalIsAr() ? -1 : 1,
            child: BarChart(
              BarChartData(
                minY: 0,
                maxY: 5,
                barTouchData: BarTouchData(enabled: false),
                borderData: FlBorderData(show: false),
                gridData: const FlGridData(
                  show: true,
                  drawVerticalLine: false,
                ),
                titlesData: titlesData,
                barGroups: myMeasurementData.measurementDataBars
                    .map(createBarChartGroupData)
                    .toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  BarChartGroupData createBarChartGroupData(IndividualMeasurementBar data) {
    return BarChartGroupData(
      x: data.x, //position
      barRods: [
        BarChartRodData(
          toY: data.y.toDouble(),
          fromY: 0,
          // color: Color.fromARGB(255, 33, 150, 87),
          /*if you want to use this below you have to remove 
                    fromY: that you in BarChartRodData in the above
                    and remave gradient also...*/
          // rodStackItems: [
          //   BarChartRodStackItem(0, 1, Colors.red),
          //   BarChartRodStackItem(1, 4, Colors.green),
          //   BarChartRodStackItem(4, 5, Colors.blue),
          // ],
          // borderSide: BorderSide(color: Colors.black, width: 4.0),
          // borderDashArray:
          //     data.x >= 4 ? [8, 4, 1] : null, //8 daxshes then 4 then 1
          gradient: const LinearGradient(colors: [
            ColorManager.primary2,
            ColorManager.green2,
            //ColorManager.green3
          ]),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(AppSize.s12),
              topRight: Radius.circular(AppSize.s12)),
          width: AppSize.s25,
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            fromY: 0,
            toY: 5,
            color: ColorManager.grey4,
          ),
        ),
      ],
    );
  }

  FlTitlesData get titlesData => FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: AppSize.s140,
            getTitlesWidget: getBottomTitles,
            interval: 1, //if null it will change automatically
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: isLeftLabelsShown,
            getTitlesWidget: getLeftTitles,
            interval: 1,
          ),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: isRightLabelsShown,
            getTitlesWidget: getRightTitles,
            interval: 1,
          ),
        ),
      );

  Widget getBottomTitles(double value, TitleMeta meta) {
    //print('bottom value yara $value'); //bottom values start from 1
    // subtracted by one to access the index of the list
    final int index = value.toInt() - 1; // index = 0,1,2,...
    /*
      so at bottom value 1 (x=1) we have lables[0]
            bottom value 2 (x=2) we have lables[1]
            and so on 
    */
    //we can use swich statement on the value
    //but i did this to minimize the code
    Widget text = index >= 0 && index < myMeasurementData.labels.length
        ? Text(myMeasurementData.labels[index], style: labelsStyle)
        : Text('', style: labelsStyle);
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 60,
      angle: LocalizationUtils.currentLocalIsAr()
          ? 90 * (pi / 180)
          : -90 * (pi / 180),
      child: FittedBox(fit: BoxFit.scaleDown, child: text),
    );
  }

  Widget getLeftTitles(double value, TitleMeta meta) {
    //print('left value yara $value'); //left values start from 0
    final int index = value.toInt(); // index = 0,1,2,...
    /*
      so at left value 0 (y=0) we have yAxisLabels[0]
            left value 1 (y=1) we have yAxisLabels[1]
            and so on 
    */
    //we can use swich statement on the value
    //but i did this to minimize the code
    Widget text = index >= 0 && index < yAxisLabels.length
        ? Text(yAxisLabels[index], style: labelsStyle)
        : Text('', style: labelsStyle);
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 8,
      angle: -90 * (pi / 180),
      child: text,
    );
  }

  Widget getRightTitles(double value, TitleMeta meta) {
    //print('right value yara $value'); //right values start from 0
    final int index = value.toInt(); // index = 0,1,2,...
    /*
      so at right value 0 (y=0) we have yAxisLabels[0]
            right value 1 (y=1) we have yAxisLabels[1]
            and so on 
    */
    //we can use swich statement on the value
    //but i did this to minimize the code
    Widget text = index >= 0 && index < yAxisLabels.length
        ? Text(yAxisLabels[index], style: labelsStyle)
        : Text('', style: labelsStyle);
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 8,
      angle: 90 * (pi / 180),
      child: text,
    );
  }
}
