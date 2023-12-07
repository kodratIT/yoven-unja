import 'package:yoven/helpers/widgets/my_text_style.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class WaterfallDefault extends StatefulWidget {
  WaterfallDefault({Key? key}) : super(key: key);

  @override
  _WaterfallDefaultState createState() => _WaterfallDefaultState();
}

class _WaterfallDefaultState extends State<WaterfallDefault> {
  late TooltipBehavior _tooltipBehavior;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(height: 320, child: _buildDefaultWaterfallChart()),
    );
  }

  SfCartesianChart _buildDefaultWaterfallChart() {
    return SfCartesianChart(
      axes: [
        CategoryAxis(
          axisLabelFormatter: (AxisLabelRenderDetails details) {
            return ChartAxisLabel(
                details.axis.name == 'Expenditure'
                    ? '${details.value ~/ 1000}B'
                    : details.text,
                null);
          },
        )
      ],
      plotAreaBorderWidth: 0,
      title: ChartTitle(
          text: 'Company revenue and profit\n',
          textStyle: MyTextStyle.bodySmall()),
      primaryXAxis: CategoryAxis(
          majorGridLines: const MajorGridLines(width: 0),
          labelIntersectAction: AxisLabelIntersectAction.rotate45),
      primaryYAxis: NumericAxis(
          name: 'Expenditure',
          minimum: 0,
          maximum: 5000,
          interval: 1000,
          axisLine: const AxisLine(width: 0),
          majorTickLines:
              const MajorTickLines(size: 8, color: Colors.transparent)),
      series: _getWaterFallSeries(),
      tooltipBehavior: _tooltipBehavior,
      onTooltipRender: (TooltipArgs args) {
        args.text =
            '${args.dataPoints![args.pointIndex!.toInt()].x} : ${args.dataPoints![args.pointIndex!.toInt()].y / 1000}B';
      },
      onDataLabelRender: (DataLabelRenderArgs dataLabelArgs) {
        if (dataLabelArgs.pointIndex == 0) {
          dataLabelArgs.text = '4.7B';
        } else if (dataLabelArgs.pointIndex == 1) {
          dataLabelArgs.text = '-1.1B';
        } else if (dataLabelArgs.pointIndex == 2) {
          dataLabelArgs.text = '-0.7B';
        } else if (dataLabelArgs.pointIndex == 3) {
          dataLabelArgs.text = '1.2B';
        } else if (dataLabelArgs.pointIndex == 4) {
          dataLabelArgs.text = '4.1B';
        } else if (dataLabelArgs.pointIndex == 5) {
          dataLabelArgs.text = '-0.4B';
        } else if (dataLabelArgs.pointIndex == 6) {
          dataLabelArgs.text = '-0.8B';
        } else if (dataLabelArgs.pointIndex == 7) {
          dataLabelArgs.text = '2.9B';
        }
      },
    );
  }

  ///Get the histogram series
  List<WaterfallSeries<_ChartSampleData, dynamic>> _getWaterFallSeries() {
    final List<_ChartSampleData> chartData = <_ChartSampleData>[
      _ChartSampleData(
          x: 'Income',
          y: 4700,
          intermediateSumPredicate: false,
          totalSumPredicate: false),
      _ChartSampleData(
          x: 'Sales',
          y: -1100,
          intermediateSumPredicate: false,
          totalSumPredicate: false),
      _ChartSampleData(
          x: 'Development',
          y: -700,
          intermediateSumPredicate: false,
          totalSumPredicate: false),
      _ChartSampleData(
          x: 'Revenue',
          y: 1200,
          intermediateSumPredicate: false,
          totalSumPredicate: false),
      _ChartSampleData(
          x: 'Balance',
          intermediateSumPredicate: true,
          totalSumPredicate: false),
      _ChartSampleData(
          x: 'Expense',
          y: -400,
          intermediateSumPredicate: false,
          totalSumPredicate: false),
      _ChartSampleData(
          x: 'Tax',
          y: -800,
          intermediateSumPredicate: false,
          totalSumPredicate: false),
      _ChartSampleData(
          x: 'Net Profit',
          intermediateSumPredicate: false,
          totalSumPredicate: true),
    ];
    return <WaterfallSeries<_ChartSampleData, dynamic>>[
      WaterfallSeries<_ChartSampleData, dynamic>(
          dataSource: chartData,
          xValueMapper: (_ChartSampleData sales, _) => sales.x,
          yValueMapper: (_ChartSampleData sales, _) => sales.y,
          intermediateSumPredicate: (_ChartSampleData sales, _) =>
              sales.intermediateSumPredicate,
          totalSumPredicate: (_ChartSampleData sales, _) =>
              sales.totalSumPredicate,
          dataLabelSettings: const DataLabelSettings(
              isVisible: true, labelAlignment: ChartDataLabelAlignment.middle),
          color: const Color.fromRGBO(0, 189, 174, 1),
          negativePointsColor: const Color.fromRGBO(229, 101, 144, 1),
          intermediateSumColor: const Color.fromRGBO(79, 129, 188, 1),
          totalSumColor: const Color.fromRGBO(79, 129, 188, 1))
    ];
  }

  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(enable: true, header: '');
    super.initState();
  }
}

class _ChartSampleData {
  _ChartSampleData(
      {this.x, this.y, this.intermediateSumPredicate, this.totalSumPredicate});

  final String? x;
  final num? y;
  final bool? intermediateSumPredicate;
  final bool? totalSumPredicate;
}
