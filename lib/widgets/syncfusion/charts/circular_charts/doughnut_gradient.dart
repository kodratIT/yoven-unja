import 'dart:ui' as ui;

import 'package:yoven/helpers/widgets/my_text_style.dart';
import 'package:yoven/widgets/syncfusion/data/charts_sample_data.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DoughnutGradient extends StatefulWidget {
  DoughnutGradient({Key? key}) : super(key: key);

  @override
  _DoughnutGradientState createState() => _DoughnutGradientState();
}

class _DoughnutGradientState extends State<DoughnutGradient> {
  late List<Color> colors;

  late List<double> stops;
  late String _shaderType;
  late List<double> customStops;

  @override
  void initState() {
    _initializeVariables();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(height: 400, child: _buildGradientDoughnutChart()));
  }

  void _initializeVariables() {
    colors = const <Color>[
      Color.fromRGBO(96, 87, 234, 1),
      Color.fromRGBO(59, 141, 236, 1),
      Color.fromRGBO(112, 198, 129, 1),
      Color.fromRGBO(237, 241, 81, 1)
    ];
    _shaderType = 'sweep';
    stops = <double>[0.25, 0.5, 0.75, 1];
  }

  SfCircularChart _buildGradientDoughnutChart() {
    return SfCircularChart(
      onCreateShader: (ChartShaderDetails chartShaderDetails) {
        if (chartShaderDetails.renderType == 'series') {
          customStops = _calculateDoughnut(colors, stops,
              chartShaderDetails.outerRect, chartShaderDetails.innerRect!);
        }
        if (_shaderType == 'linear') {
          return ui.Gradient.linear(chartShaderDetails.outerRect.topRight,
              chartShaderDetails.outerRect.centerLeft, colors, stops);
        } else if (_shaderType == 'radial') {
          return ui.Gradient.radial(
              chartShaderDetails.outerRect.center,
              chartShaderDetails.outerRect.right -
                  chartShaderDetails.outerRect.center.dx,
              colors,
              customStops);
        } else {
          return ui.Gradient.sweep(
              chartShaderDetails.outerRect.center,
              colors,
              stops,
              TileMode.clamp,
              _degreeToRadian(0),
              _degreeToRadian(360),
              _resolveTransform(
                  chartShaderDetails.outerRect, TextDirection.ltr));
        }
      },
      title: ChartTitle(
          text: 'Sales by sales person', textStyle: MyTextStyle.bodySmall()),
      legend: Legend(isVisible: true, position: LegendPosition.bottom),
      series: _getGradientDoughnutSeries(),
    );
  }

  List<DoughnutSeries<ChartSampleData, String>> _getGradientDoughnutSeries() {
    final List<ChartSampleData> pieData = <ChartSampleData>[
      ChartSampleData(x: 'David', y: 14, text: '14%'),
      ChartSampleData(x: 'Steve', y: 15, text: '15%'),
      ChartSampleData(x: 'Jack', y: 30, text: '30%'),
      ChartSampleData(x: 'Others', y: 41, text: '41%')
    ];
    return <DoughnutSeries<ChartSampleData, String>>[
      DoughnutSeries<ChartSampleData, String>(
          dataSource: pieData,
          explodeAll: true,
          radius: '63%',
          explodeOffset: '3%',
          explode: true,
          strokeColor: Theme.of(context).brightness == Brightness.light
              ? Colors.black.withOpacity(0.3)
              : Colors.white.withOpacity(0.3),
          strokeWidth: 1.5,
          dataLabelSettings: DataLabelSettings(
            isVisible: true,
            labelPosition: ChartDataLabelPosition.outside,
            connectorLineSettings: ConnectorLineSettings(
              color: Theme.of(context).brightness == Brightness.light
                  ? Colors.black.withOpacity(0.5)
                  : Colors.white,
              width: 1.5,
              length: '10%',
              type: ConnectorType.curve,
            ),
          ),
          xValueMapper: (ChartSampleData data, _) => data.x as String,
          yValueMapper: (ChartSampleData data, _) => data.y,
          dataLabelMapper: (ChartSampleData data, _) => data.text),
    ];
  }

  dynamic _resolveTransform(Rect bounds, TextDirection textDirection) {
    final GradientTransform transform = GradientRotation(_degreeToRadian(-90));
    return transform.transform(bounds, textDirection: textDirection)!.storage;
  }

  void onShaderTyeChange(String item) {
    _shaderType = item;
    setState(() {
      if (_shaderType == 'linear') {
        _shaderType = 'linear';
      }

      if (_shaderType == 'radial') {
        _shaderType = 'radial';
      }
      if (_shaderType == 'sweep') {
        _shaderType = 'sweep';
      }
    });
  }

  double _degreeToRadian(int deg) => deg * (3.141592653589793 / 180);

  List<double> _calculateDoughnut(
      List<Color> colors, List<double> stops, Rect outerRect, Rect innerRect) {
    final List<double> stopOffsets = <double>[];
    final num chartStart = innerRect.right;
    final Offset chartCenter = outerRect.center;
    final num chartend = outerRect.right;
    num diffCenterEnd;
    num diffStartEnd;
    num diffCenterStart;
    num centerStops;
    diffCenterEnd = chartend - chartCenter.dx;
    diffStartEnd = chartend - chartStart;
    diffCenterStart = chartStart - chartCenter.dx;
    centerStops = diffCenterStart / diffCenterEnd;
    for (int i = 0; i < colors.length; i++) {
      if (i == 0) {
        stopOffsets.add(centerStops += diffStartEnd * stops[i] / diffCenterEnd);
      } else {
        stopOffsets.add(centerStops +=
            (diffStartEnd * (stops[i] - stops[i - 1])) / diffCenterEnd);
      }
    }
    return stopOffsets;
  }
}
