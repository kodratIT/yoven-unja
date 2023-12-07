/*
* File : Top Navigation widget
* Version : 1.0.0
* Description :
* */

import 'package:jambicraff/widgets/syncfusion/data/charts_sample_data.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_core/core.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class RangeSelectorScreen extends StatefulWidget {
  @override
  _RangeSelectorScreenState createState() => _RangeSelectorScreenState();
}

class _RangeSelectorScreenState extends State<RangeSelectorScreen> {
  final DateTime min = DateTime(2002, 01, 01), max = DateTime(2011, 01, 01);
  late List<ChartSampleData> chartData;
  late RangeController rangeController;
  late LinearGradient gradientColors;

  @override
  void initState() {
    super.initState();
    chartData = <ChartSampleData>[
      ChartSampleData(x: DateTime(2002, 01, 01), y: 2.2),
      ChartSampleData(x: DateTime(2003, 01, 01), y: 3.4),
      ChartSampleData(x: DateTime(2004, 01, 01), y: 2.8),
      ChartSampleData(x: DateTime(2005, 01, 01), y: 1.6),
      ChartSampleData(x: DateTime(2006, 01, 01), y: 2.3),
      ChartSampleData(x: DateTime(2007, 01, 01), y: 2.5),
      ChartSampleData(x: DateTime(2008, 01, 01), y: 2.9),
      ChartSampleData(x: DateTime(2009, 01, 01), y: 3.8),
      ChartSampleData(x: DateTime(2010, 01, 01), y: 1.4),
      ChartSampleData(x: DateTime(2011, 01, 01), y: 3.1),
    ];
    rangeController = RangeController(
      start: DateTime(2005, 01, 01),
      end: DateTime(2008, 01, 01),
    );
    gradientColors = const LinearGradient(colors: <Color>[
      Color.fromRGBO(255, 125, 30, 0.4),
      Color.fromRGBO(255, 125, 30, 1)
    ], stops: <double>[
      0.0,
      0.5
    ]);
  }

  double _getAverageInflationRate(RangeController values) {
    double totalData = 0;
    int dataCount = 0;
    double startRate = 1.6;
    for (int i = 0; i < chartData.length; i++) {
      if (chartData[i].x.year == (values.start as DateTime).year) {
        startRate = chartData[i].y!.toDouble();
      }
      if (chartData[i].x.isAfter(
              //ignore: avoid_as
              (values.start as DateTime)
                  .subtract(const Duration(hours: 12))) as bool &&
          chartData[i].x.isBefore(
                  //ignore: avoid_as
                  (values.end as DateTime).add(const Duration(hours: 12)))
              as bool) {
        dataCount++;
        totalData += chartData[i].y!;
      }
    }
    return totalData = dataCount != 0 ? totalData / dataCount : startRate;
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Container(
      margin: const EdgeInsets.all(0),
      padding: const EdgeInsets.all(0),
      child: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(0, 2, 0, 5),
            child: const SizedBox(
              height: 30,
              child: Center(
                child: Text(
                  'Inflation Rate In Percentage',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Center(
              child: SfRangeSelectorTheme(
                data: SfRangeSelectorThemeData(
                  labelOffset: const Offset(0, 0),
                  activeLabelStyle: TextStyle(
                      fontSize: 10,
                      color: themeData.textTheme.bodyLarge!.color!
                          .withOpacity(0.87)),
                  inactiveLabelStyle: TextStyle(
                      fontSize: 10,
                      color: themeData.textTheme.bodyLarge!.color!
                          .withOpacity(0.87)),
                  inactiveRegionColor: themeData.brightness == Brightness.light
                      ? Colors.white.withOpacity(0.75)
                      : const Color.fromRGBO(33, 33, 33, 0.75),
                ),
                child: SfRangeSelector(
                  min: min,
                  max: max,
                  interval: 1,
                  controller: rangeController,
                  dateFormat: DateFormat.y(),
                  dateIntervalType: DateIntervalType.years,
                  showTicks: true,
                  showLabels: true,
                  enableTooltip: true,
                  tooltipTextFormatterCallback:
                      (dynamic actualLabel, String formattedText) {
                    return DateFormat.yMMMd().format(actualLabel).toString();
                  },
                  onChanged: (SfRangeValues values) {
                    setState(() {});
                  },
                  child: SizedBox(
                    width: mediaQueryData.size.width,
                    height: mediaQueryData.size.height * 0.4,
                    child: SfCartesianChart(
                      margin: const EdgeInsets.all(0),
                      primaryXAxis: DateTimeAxis(
                        minimum: min,
                        maximum: max,
                        isVisible: false,
                      ),
                      primaryYAxis: NumericAxis(isVisible: false, maximum: 4),
                      plotAreaBorderWidth: 0,
                      series: <SplineAreaSeries<ChartSampleData, DateTime>>[
                        SplineAreaSeries<ChartSampleData, DateTime>(
                            dataSource: chartData,
                            xValueMapper: (ChartSampleData sales, _) =>
                                sales.x as DateTime,
                            yValueMapper: (ChartSampleData sales, _) => sales.y,
                            gradient: gradientColors,
                            animationDuration: 0)
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: mediaQueryData.size.height * 0.1),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: 25,
                child: Text(
                  'Average rate   :   ${_getAverageInflationRate(rangeController).toStringAsFixed(2)}%',
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
