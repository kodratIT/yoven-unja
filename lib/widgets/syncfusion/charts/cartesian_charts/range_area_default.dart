import 'dart:math';

import 'package:yoven/helpers/widgets/my_text_style.dart';
import 'package:yoven/widgets/syncfusion/data/charts_sample_data.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class RangeAreaDefault extends StatefulWidget {
  RangeAreaDefault({Key? key}) : super(key: key);

  @override
  _RangeAreaDefaultState createState() => _RangeAreaDefaultState();
}

class _RangeAreaDefaultState extends State<RangeAreaDefault> {
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(enable: true, decimalPlaces: 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(height: 320, child: _buildRangeAreaChart()),
    );
  }

  SfCartesianChart _buildRangeAreaChart() {
    return SfCartesianChart(
      title: ChartTitle(
          text: 'Average temperature variation\n',
          textStyle: MyTextStyle.bodySmall()),
      plotAreaBorderWidth: 0,
      primaryXAxis: DateTimeAxis(
          interval: 1,
          majorGridLines: const MajorGridLines(width: 0),
          edgeLabelPlacement: EdgeLabelPlacement.shift),
      primaryYAxis: NumericAxis(
          labelFormat: '{value}°C',
          axisLine: const AxisLine(width: 0),
          majorTickLines:
              const MajorTickLines(size: 8, color: Colors.transparent)),
      series: _getRangeAreaSeries(),
      tooltipBehavior: _tooltipBehavior,
    );
  }

  List<ChartSampleData> _getData() {
    List<ChartSampleData> chartData;
    chartData = <ChartSampleData>[];
    double value = 30;
    for (int i = 0; i < 100; i++) {
      final Random yValue = Random();
      (yValue.nextDouble() > .5)
          ? value += Random().nextDouble()
          : value -= Random().nextDouble();

      chartData.add(ChartSampleData(
          x: DateTime(2000, i + 2, i), high: value, low: value + 10));
    }
    return chartData;
  }

  List<ChartSeries<ChartSampleData, DateTime>> _getRangeAreaSeries() {
    final List<ChartSampleData> chartData = _getData();
    return <ChartSeries<ChartSampleData, DateTime>>[
      RangeAreaSeries<ChartSampleData, DateTime>(
        dataSource: chartData,
        name: 'London',
        borderWidth: 2,
        opacity: 0.5,
        borderColor: const Color.fromRGBO(50, 198, 255, 1),
        color: const Color.fromRGBO(50, 198, 255, 1),
        borderDrawMode: RangeAreaBorderMode.excludeSides,
        xValueMapper: (ChartSampleData sales, _) => sales.x as DateTime,
        highValueMapper: (ChartSampleData sales, _) => sales.high,
        lowValueMapper: (ChartSampleData sales, _) => sales.low,
      )
    ];
  }
}
