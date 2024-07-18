import 'dart:math';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../../../../domain/entities/analysis_data_entity.dart';
import '../../../../domain/entities/image_analysis_entity.dart';
import '../../../../domain/entities/measurement_data_entity.dart';
import '../../../../generated/l10n.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/language_manager.dart';
import '../../../resources/styles_manager.dart';
import '../../../resources/values_manager.dart';

class AnalysisBarGraph extends StatefulWidget {
  final ImageAnalysisEntity imageAnalysisEntity;
  const AnalysisBarGraph({
    super.key,
    required this.imageAnalysisEntity,
  });

  @override
  State<AnalysisBarGraph> createState() => _AnalysisBarGraphState();
}

class _AnalysisBarGraphState extends State<AnalysisBarGraph> {
  late AnalysisDataEntity analysisDataEntity;

  List<String> get yAxisLabels => [
        S.current.zero_percent,
        S.current.ten_percent,
        S.current.twenty_percent,
        S.current.thirty_percent,
        S.current.fourty_percent,
        S.current.fifty_percent,
        S.current.sixty_percent,
        S.current.seventy_percent,
        S.current.eighty_percent,
        S.current.ninty_percent,
        S.current.handred_percent,
      ];

  TextStyle get labelsStyle => Styles.style18Medium();

  @override
  void initState() {
    super.initState();
    analysisDataEntity = initializeAnalysisData();
  }

  AnalysisDataEntity initializeAnalysisData() {
    return AnalysisDataEntity(imageAnalysisEntity: widget.imageAnalysisEntity);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(
          top: AppSize.s30,
          bottom: AppSize.s26,
          right: AppSize.s26,
          left: 0,
        ),
        child: AspectRatio(
          aspectRatio: 1 / 1.2,
          child: BarChart(
            BarChartData(
              minY: 0,
              maxY: 100,
              barTouchData: barTouchData,
              borderData: FlBorderData(show: false),
              gridData: const FlGridData(
                show: true,
                drawVerticalLine: false,
              ),
              titlesData: titlesData,
              barGroups: analysisDataEntity.analysisDataBars
                  .map(createBarChartGroupData)
                  .toList(),
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
          toY: data.y as double,
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
          width: AppSize.s20,
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            fromY: 0,
            toY: 100,
            color: ColorManager.grey4,
          ),
        ),
      ],
    );
  }

  BarTouchData get barTouchData => BarTouchData(
        enabled: true,
        touchCallback:
            (FlTouchEvent flTouchEvent, BarTouchResponse? barTouchResponse) {},
        touchTooltipData: BarTouchTooltipData(
          tooltipRoundedRadius: AppSize.s18,
          maxContentWidth: AppSize.s200,
          getTooltipColor: (group) {
            return ColorManager.pink3;
          },
        ),
        mouseCursorResolver:
            (FlTouchEvent flTouchEvent, BarTouchResponse? barTouchResponse) {
          if (barTouchResponse != null && barTouchResponse.spot != null) {
            return SystemMouseCursors.click;
          } else {
            return SystemMouseCursors.basic;
          }
        },
      );

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
            showTitles: true,
            reservedSize: AppSize.s70,
            getTitlesWidget: getYAxisTitles,
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
            showTitles: false,
            reservedSize: AppSize.s70,
            getTitlesWidget: getYAxisTitles,
            interval: 1,
          ),
        ),
      );

  Widget getBottomTitles(double value, TitleMeta meta) {
    Widget text = Text('', style: labelsStyle);
    switch (value.toInt()) {
      case 1:
        if (value.toInt() <= analysisDataEntity.labels.length) {
          text = Text(analysisDataEntity.labels[0], style: labelsStyle);
        }
        break;
      case 2:
        if (value.toInt() <= analysisDataEntity.labels.length) {
          text = Text(analysisDataEntity.labels[1], style: labelsStyle);
        }
        break;
      case 3:
        if (value.toInt() <= analysisDataEntity.labels.length) {
          text = Text(analysisDataEntity.labels[2], style: labelsStyle);
        }
        break;
      case 4:
        if (value.toInt() <= analysisDataEntity.labels.length) {
          text = Text(analysisDataEntity.labels[3], style: labelsStyle);
        }
        break;
      case 5:
        if (value.toInt() <= analysisDataEntity.labels.length) {
          text = Text(analysisDataEntity.labels[4], style: labelsStyle);
        }
        break;
      case 6:
        if (value.toInt() <= analysisDataEntity.labels.length) {
          text = Text(analysisDataEntity.labels[5], style: labelsStyle);
        }
        break;
      case 7:
        if (value.toInt() <= analysisDataEntity.labels.length) {
          text = Text(analysisDataEntity.labels[6], style: labelsStyle);
        }
        break;
      case 8:
        if (value.toInt() <= analysisDataEntity.labels.length) {
          text = Text(analysisDataEntity.labels[7], style: labelsStyle);
        }
        break;
      case 9:
        if (value.toInt() <= analysisDataEntity.labels.length) {
          text = Text(analysisDataEntity.labels[8], style: labelsStyle);
        }
        break;
      case 10:
        if (value.toInt() <= analysisDataEntity.labels.length) {
          text = Text(analysisDataEntity.labels[9], style: labelsStyle);
        }
        break;
      case 11:
        if (value.toInt() <= analysisDataEntity.labels.length) {
          text = Text(analysisDataEntity.labels[10], style: labelsStyle);
        }
        break;
      case 12:
        if (value.toInt() <= analysisDataEntity.labels.length) {
          text = Text(analysisDataEntity.labels[11], style: labelsStyle);
        }
        break;
      case 13:
        if (value.toInt() <= analysisDataEntity.labels.length) {
          text = Text(analysisDataEntity.labels[12], style: labelsStyle);
        }
        break;
      default:
        text = Text('', style: labelsStyle);
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 60,
      angle: LocalizationUtils.currentLocalIsAr()
          ? 90 * (pi / 180)
          : -90 * (pi / 180),
      child: text,
    );
  }

  Widget getYAxisTitles(double value, TitleMeta meta) {
    Widget text = Text('', style: labelsStyle);
    switch (value.toInt()) {
      case 0:
        text = Text(yAxisLabels[0], style: labelsStyle);
        break;
      // case 10:
      //   text = Text(yAxisLabels[1], style: labelsStyle);
      //   break;
      case 20:
        text = Text(yAxisLabels[2], style: labelsStyle);
        break;
      // case 30:
      //   text = Text(yAxisLabels[3], style: labelsStyle);
      //   break;
      case 40:
        text = Text(yAxisLabels[4], style: labelsStyle);
        break;
      // case 50:
      //   text = Text(yAxisLabels[5], style: labelsStyle);
      //   break;
      case 60:
        text = Text(yAxisLabels[6], style: labelsStyle);
        break;
      // case 70:
      //   text = Text(yAxisLabels[7], style: labelsStyle);
      //   break;
      case 80:
        text = Text(yAxisLabels[8], style: labelsStyle);
        break;
      // case 90:
      //   text = Text(yAxisLabels[9], style: labelsStyle);
      //   break;
      case 100:
        text = Text(yAxisLabels[10], style: labelsStyle);
        break;
      default:
        text = Text('', style: labelsStyle);
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 20,
      child: text,
    );
  }
}
