import 'package:yoven/helpers/widgets/my_text_style.dart';
import 'package:yoven/widgets/syncfusion/data/charts_sample_data.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class FunnelLabel extends StatefulWidget {
  FunnelLabel({Key? key}) : super(key: key);

  @override
  _FunnelLabelState createState() => _FunnelLabelState();
}

class _FunnelLabelState extends State<FunnelLabel> {
  final ChartDataLabelPosition _selectedLabelPosition =
      ChartDataLabelPosition.outside;

  // SmartLabelMode _mode = SmartLabelMode.shift;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(height: 400, child: _buildFunnelSmartLabelChart()));
  }

  SfFunnelChart _buildFunnelSmartLabelChart() {
    return SfFunnelChart(
      // smartLabelMode: _mode,
      title: ChartTitle(
          text: 'Tournament details', textStyle: MyTextStyle.bodySmall()),
      tooltipBehavior: TooltipBehavior(
        enable: true,
      ),
      series: _getFunnelSeries(),
    );
  }

  FunnelSeries<ChartSampleData, String> _getFunnelSeries() {
    final List<ChartSampleData> pieData = <ChartSampleData>[
      ChartSampleData(x: 'Finals', y: 2),
      ChartSampleData(x: 'Semifinals', y: 4),
      ChartSampleData(x: 'Quarter finals', y: 8),
      ChartSampleData(x: 'League matches', y: 16),
      ChartSampleData(x: 'Participated', y: 32),
      ChartSampleData(x: 'Eligible', y: 36),
      ChartSampleData(x: 'Applicants', y: 40),
    ];
    return FunnelSeries<ChartSampleData, String>(
        width: '60%',
        dataSource: pieData,
        xValueMapper: (ChartSampleData data, _) => data.x as String,
        yValueMapper: (ChartSampleData data, _) => data.y,
        dataLabelSettings: DataLabelSettings(
            isVisible: true,
            labelPosition: _selectedLabelPosition,
            useSeriesColor: true));
  }
}
