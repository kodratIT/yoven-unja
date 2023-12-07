import 'package:jambicraff/helpers/widgets/my_text_style.dart';
import 'package:jambicraff/widgets/syncfusion/data/charts_sample_data.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DoughnutElevated extends StatefulWidget {
  DoughnutElevated({Key? key}) : super(key: key);

  @override
  _DoughnutElevatedState createState() => _DoughnutElevatedState();
}

class _DoughnutElevatedState extends State<DoughnutElevated> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Center(
          child: SizedBox(height: 400, child: _buildElevationDoughnutChart())),
    );
  }

  SfCircularChart _buildElevationDoughnutChart() {
    return SfCircularChart(
      annotations: <CircularChartAnnotation>[
        CircularChartAnnotation(
            height: '100%',
            width: '100%',
            widget: PhysicalModel(
              shape: BoxShape.circle,
              elevation: 10,
              shadowColor: Colors.black,
              color: Color.fromRGBO(230, 230, 230, 1),
              child: Container(),
            )),
        CircularChartAnnotation(
            widget: Text('62%',
                style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 0.5), fontSize: 25)))
      ],
      title: ChartTitle(
          text: 'Progress of a task', textStyle: MyTextStyle.bodySmall()),
      series: _getElevationDoughnutSeries(),
    );
  }

  List<DoughnutSeries<ChartSampleData, String>> _getElevationDoughnutSeries() {
    final List<ChartSampleData> chartData = <ChartSampleData>[
      ChartSampleData(
          x: 'A', y: 62, pointColor: Color.fromRGBO(0, 220, 252, 1)),
      ChartSampleData(
          x: 'B', y: 38, pointColor: Color.fromRGBO(230, 230, 230, 1))
    ];

    return <DoughnutSeries<ChartSampleData, String>>[
      DoughnutSeries<ChartSampleData, String>(
          dataSource: chartData,
          animationDuration: 0,
          xValueMapper: (ChartSampleData data, _) => data.x as String,
          yValueMapper: (ChartSampleData data, _) => data.y,
          pointColorMapper: (ChartSampleData data, _) => data.pointColor)
    ];
  }
}
