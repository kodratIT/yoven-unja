import 'package:jambicraff/helpers/widgets/my_text_style.dart';
import 'package:jambicraff/widgets/syncfusion/data/charts_sample_data.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PieRadius extends StatefulWidget {
  PieRadius({Key? key}) : super(key: key);

  @override
  _PieRadiusState createState() => _PieRadiusState();
}

class _PieRadiusState extends State<PieRadius> {
  @override
  Widget build(BuildContext context) {
    return Center(child: SizedBox(height: 400, child: _buildRadiusPieChart()));
  }

  SfCircularChart _buildRadiusPieChart() {
    return SfCircularChart(
      title: ChartTitle(
          text: 'Various countries population density and area',
          textStyle: MyTextStyle.bodySmall()),
      legend: Legend(
          isVisible: true,
          overflowMode: LegendItemOverflowMode.wrap,
          position: LegendPosition.bottom),
      series: _getRadiusPieSeries(),
      tooltipBehavior: TooltipBehavior(enable: true),
    );
  }

  List<PieSeries<ChartSampleData, String>> _getRadiusPieSeries() {
    final List<ChartSampleData> chartData = <ChartSampleData>[
      ChartSampleData(x: 'Argentina', y: 505370, text: '45%'),
      ChartSampleData(x: 'Belgium', y: 551500, text: '53.7%'),
      ChartSampleData(x: 'Cuba', y: 312685, text: '59.6%'),
      ChartSampleData(x: 'Dominican Republic', y: 350000, text: '72.5%'),
      ChartSampleData(x: 'Egypt', y: 301000, text: '85.8%'),
      ChartSampleData(x: 'Kazakhstan', y: 300000, text: '90.5%'),
      ChartSampleData(x: 'Somalia', y: 357022, text: '95.6%')
    ];
    return <PieSeries<ChartSampleData, String>>[
      PieSeries<ChartSampleData, String>(
          dataSource: chartData,
          xValueMapper: (ChartSampleData data, _) => data.x as String,
          yValueMapper: (ChartSampleData data, _) => data.y,
          dataLabelMapper: (ChartSampleData data, _) => data.x as String,
          startAngle: 100,
          endAngle: 100,
          pointRadiusMapper: (ChartSampleData data, _) => data.text,
          dataLabelSettings: const DataLabelSettings(
              isVisible: true, labelPosition: ChartDataLabelPosition.outside))
    ];
  }
}
