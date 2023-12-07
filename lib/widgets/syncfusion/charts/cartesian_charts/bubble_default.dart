import 'package:jambicraff/helpers/widgets/my_text_style.dart';
import 'package:jambicraff/widgets/syncfusion/data/charts_sample_data.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class BubbleDefault extends StatefulWidget {
  BubbleDefault({Key? key}) : super(key: key);

  @override
  _BubbleDefaultState createState() => _BubbleDefaultState();
}

class _BubbleDefaultState extends State<BubbleDefault> {
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(
        enable: true,
        textAlignment: ChartAlignment.center,
        header: '',
        canShowMarker: false,
        format:
            'point.x\nLiteracy rate : point.x%\nGDP growth rate : point.y\nPopulation : point.sizeB');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(height: 320, child: _buildDefaultBubbleChart()),
    );
  }

  SfCartesianChart _buildDefaultBubbleChart() {
    return SfCartesianChart(
        plotAreaBorderWidth: 0,
        title: ChartTitle(
            text: 'World countries details\n',
            textStyle: MyTextStyle.bodySmall()),
        primaryXAxis: NumericAxis(
            majorGridLines: const MajorGridLines(width: 0),
            title: AxisTitle(
                text: 'Literacy rate', textStyle: MyTextStyle.bodySmall()),
            minimum: 60,
            maximum: 100),
        primaryYAxis: NumericAxis(
            axisLine: const AxisLine(width: 0),
            majorTickLines:
                const MajorTickLines(size: 8, color: Colors.transparent),
            title: AxisTitle(
                text: 'GDP growth rate', textStyle: MyTextStyle.bodySmall())),
        tooltipBehavior: _tooltipBehavior,
        series: _getDefaultBubbleSeries());
  }

  List<BubbleSeries<ChartSampleData, num>> _getDefaultBubbleSeries() {
    final List<ChartSampleData> bubbleData = <ChartSampleData>[
      ChartSampleData(x: 'China', xValue: 92.2, y: 7.8, size: 1.347),
      ChartSampleData(x: 'India', xValue: 74, y: 6.5, size: 1.241),
      ChartSampleData(x: 'Indonesia', xValue: 90.4, y: 6.0, size: 0.238),
      ChartSampleData(x: 'US', xValue: 99.4, y: 2.2, size: 0.312),
      ChartSampleData(x: 'Germany', xValue: 99, y: 0.7, size: 0.0818),
      ChartSampleData(x: 'Egypt', xValue: 72, y: 2.0, size: 0.0826),
      ChartSampleData(x: 'Russia', xValue: 99.6, y: 3.4, size: 0.143),
      ChartSampleData(x: 'Japan', xValue: 99, y: 0.2, size: 0.128),
      ChartSampleData(x: 'Mexico', xValue: 86.1, y: 4.0, size: 0.115),
      ChartSampleData(x: 'Philippines', xValue: 92.6, y: 6.6, size: 0.096),
      ChartSampleData(x: 'Nigeria', xValue: 61.3, y: 1.45, size: 0.162),
      ChartSampleData(x: 'Hong Kong', xValue: 82.2, y: 3.97, size: 0.7),
      ChartSampleData(x: 'Netherland', xValue: 79.2, y: 3.9, size: 0.162),
      ChartSampleData(x: 'Jordan', xValue: 72.5, y: 4.5, size: 0.7),
      ChartSampleData(x: 'Australia', xValue: 81, y: 3.5, size: 0.21),
      ChartSampleData(x: 'Mongolia', xValue: 66.8, y: 3.9, size: 0.028),
      ChartSampleData(x: 'Taiwan', xValue: 78.4, y: 2.9, size: 0.231),
    ];
    return <BubbleSeries<ChartSampleData, num>>[
      BubbleSeries<ChartSampleData, num>(
        opacity: 0.7,
        dataSource: bubbleData,
        xValueMapper: (ChartSampleData sales, _) => sales.xValue as num,
        yValueMapper: (ChartSampleData sales, _) => sales.y,
        sizeValueMapper: (ChartSampleData sales, _) => sales.size,
      )
    ];
  }
}
