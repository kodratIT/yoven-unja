import 'package:jambicraff/helpers/widgets/my_text_style.dart';
import 'package:jambicraff/widgets/syncfusion/data/charts_sample_data.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PieDefault extends StatefulWidget {
  PieDefault({Key? key}) : super(key: key);

  @override
  _PieDefaultState createState() => _PieDefaultState();
}

class _PieDefaultState extends State<PieDefault> {
  @override
  Widget build(BuildContext context) {
    return Center(child: SizedBox(height: 400, child: _buildDefaultPieChart()));
  }

  SfCircularChart _buildDefaultPieChart() {
    return SfCircularChart(
      title: ChartTitle(
          text: 'Sales by sales person', textStyle: MyTextStyle.bodySmall()),
      legend: Legend(isVisible: true, position: LegendPosition.bottom),
      series: _getDefaultPieSeries(),
    );
  }

  List<PieSeries<ChartSampleData, String>> _getDefaultPieSeries() {
    final List<ChartSampleData> pieData = <ChartSampleData>[
      ChartSampleData(x: 'David', y: 13, text: 'David \n 13%'),
      ChartSampleData(x: 'Steve', y: 24, text: 'Steve \n 24%'),
      ChartSampleData(x: 'Jack', y: 25, text: 'Jack \n 25%'),
      ChartSampleData(x: 'Others', y: 38, text: 'Others \n 38%'),
    ];
    return <PieSeries<ChartSampleData, String>>[
      PieSeries<ChartSampleData, String>(
          explode: true,
          explodeIndex: 0,
          explodeOffset: '10%',
          dataSource: pieData,
          xValueMapper: (ChartSampleData data, _) => data.x as String,
          yValueMapper: (ChartSampleData data, _) => data.y,
          dataLabelMapper: (ChartSampleData data, _) => data.text,
          startAngle: 90,
          endAngle: 90,
          dataLabelSettings: const DataLabelSettings(isVisible: true)),
    ];
  }
}
