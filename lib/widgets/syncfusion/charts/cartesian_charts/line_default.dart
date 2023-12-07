import 'package:jambicraff/helpers/widgets/my_text_style.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LineDefault extends StatefulWidget {
  const LineDefault({Key? key}) : super(key: key);

  @override
  _LineDefaultState createState() => _LineDefaultState();
}

class _LineDefaultState extends State<LineDefault> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(height: 320, child: _buildDefaultLineChart()),
    );
  }

  SfCartesianChart _buildDefaultLineChart() {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      title: ChartTitle(
          text: 'Inflation - Consumer price\n',
          textStyle: MyTextStyle.bodySmall(),
          alignment: ChartAlignment.center),
      legend: Legend(
          isVisible: true,
          overflowMode: LegendItemOverflowMode.wrap,
          position: LegendPosition.bottom),
      primaryXAxis: NumericAxis(
          edgeLabelPlacement: EdgeLabelPlacement.shift,
          interval: 2,
          majorGridLines: const MajorGridLines(width: 0)),
      primaryYAxis: NumericAxis(
          labelFormat: '{value}%',
          axisLine: const AxisLine(width: 0),
          majorTickLines:
              const MajorTickLines(size: 8, color: Colors.transparent)),
      series: _getDefaultLineSeries(),
      tooltipBehavior: TooltipBehavior(enable: true),
    );
  }

  List<LineSeries<_ChartData, num>> _getDefaultLineSeries() {
    final List<_ChartData> chartData = <_ChartData>[
      _ChartData(2005, 21, 28),
      _ChartData(2006, 24, 44),
      _ChartData(2007, 36, 48),
      _ChartData(2008, 38, 50),
      _ChartData(2009, 54, 66),
      _ChartData(2010, 57, 78),
      _ChartData(2011, 70, 84)
    ];
    return <LineSeries<_ChartData, num>>[
      LineSeries<_ChartData, num>(
          animationDuration: 2500,
          dataSource: chartData,
          xValueMapper: (_ChartData sales, _) => sales.x,
          yValueMapper: (_ChartData sales, _) => sales.y,
          width: 2,
          name: 'Germany',
          markerSettings: const MarkerSettings(isVisible: true)),
      LineSeries<_ChartData, num>(
          animationDuration: 2500,
          dataSource: chartData,
          width: 2,
          name: 'England',
          xValueMapper: (_ChartData sales, _) => sales.x,
          yValueMapper: (_ChartData sales, _) => sales.y2,
          markerSettings: const MarkerSettings(isVisible: true))
    ];
  }
}

class _ChartData {
  _ChartData(this.x, this.y, this.y2);

  final double x;
  final double y;
  final double y2;
}
