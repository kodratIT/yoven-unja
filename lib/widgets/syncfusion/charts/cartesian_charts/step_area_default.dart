import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class StepAreaDefault extends StatefulWidget {
  StepAreaDefault({Key? key}) : super(key: key);

  @override
  _StepAreaDefaultState createState() => _StepAreaDefaultState();
}

class _StepAreaDefaultState extends State<StepAreaDefault> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(height: 320, child: _buildStepAreaChart()),
    );
  }

  SfCartesianChart _buildStepAreaChart() {
    return SfCartesianChart(
      legend: Legend(isVisible: true, position: LegendPosition.bottom),
      title: ChartTitle(text: 'Temperature variation of Paris\n'),
      plotAreaBorderWidth: 0,
      primaryXAxis: DateTimeAxis(
          majorGridLines: const MajorGridLines(width: 0),
          edgeLabelPlacement: EdgeLabelPlacement.shift),
      primaryYAxis: NumericAxis(
          labelFormat: '{value}°C',
          interval: 2,
          maximum: 16,
          axisLine: const AxisLine(width: 0),
          majorTickLines:
              const MajorTickLines(size: 8, color: Colors.transparent)),
      series: _getStepAreaSeries(),
      tooltipBehavior: TooltipBehavior(enable: true),
    );
  }

  List<ChartSeries<_StepAreaData, DateTime>> _getStepAreaSeries() {
    final List<_StepAreaData> chartData = <_StepAreaData>[
      _StepAreaData(DateTime(2019, 3, 1), 12, 9),
      _StepAreaData(DateTime(2019, 3, 2), 13, 7),
      _StepAreaData(DateTime(2019, 3, 3), 14, 10),
      _StepAreaData(DateTime(2019, 3, 4), 12, 5),
      _StepAreaData(DateTime(2019, 3, 5), 12, 4),
      _StepAreaData(DateTime(2019, 3, 6), 12, 8),
      _StepAreaData(DateTime(2019, 3, 7), 13, 6),
      _StepAreaData(DateTime(2019, 3, 8), 12, 4),
      _StepAreaData(DateTime(2019, 3, 9), 15, 8),
      _StepAreaData(DateTime(2019, 3, 10), 14, 7),
      _StepAreaData(DateTime(2019, 3, 11), 10, 3),
      _StepAreaData(DateTime(2019, 3, 12), 13, 4),
      _StepAreaData(DateTime(2019, 3, 13), 12, 4),
      _StepAreaData(DateTime(2019, 3, 14), 11, 6),
      _StepAreaData(DateTime(2019, 3, 15), 14, 10),
      _StepAreaData(DateTime(2019, 3, 16), 14, 9),
      _StepAreaData(DateTime(2019, 3, 17), 11, 4),
      _StepAreaData(DateTime(2019, 3, 18), 11, 2),
    ];
    return <ChartSeries<_StepAreaData, DateTime>>[
      StepAreaSeries<_StepAreaData, DateTime>(
        dataSource: chartData,
        color: const Color.fromRGBO(75, 135, 185, 0.6),
        borderColor: const Color.fromRGBO(75, 135, 185, 1),
        borderWidth: 2,
        name: 'High',
        xValueMapper: (_StepAreaData sales, _) => sales.x,
        yValueMapper: (_StepAreaData sales, _) => sales.high,
      ),
      StepAreaSeries<_StepAreaData, DateTime>(
        dataSource: chartData,
        borderColor: const Color.fromRGBO(192, 108, 132, 1),
        color: const Color.fromRGBO(192, 108, 132, 0.6),
        borderWidth: 2,
        name: 'Low',
        xValueMapper: (_StepAreaData sales, _) => sales.x,
        yValueMapper: (_StepAreaData sales, _) => sales.low,
      )
    ];
  }
}

class _StepAreaData {
  _StepAreaData(this.x, this.high, this.low);

  final DateTime x;
  final double high;
  final double low;
}
