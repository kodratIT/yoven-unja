import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class VerticalRangeSliderStepScreen extends StatefulWidget {
  @override
  _VerticalRangeSliderStepScreenState createState() =>
      _VerticalRangeSliderStepScreenState();
}

class _VerticalRangeSliderStepScreenState
    extends State<VerticalRangeSliderStepScreen> {
  SfRangeValues _yearValues =
      SfRangeValues(DateTime(2005, 1, 01), DateTime(2015, 1, 1));
  SfRangeValues _values = const SfRangeValues(-25.0, 25.0);

  SfRangeSliderTheme _yearRangeSlider() {
    return SfRangeSliderTheme(
        data: SfRangeSliderThemeData(),
        child: SfRangeSlider.vertical(
          min: DateTime(2000, 01, 01),
          max: DateTime(2020, 01, 01),
          showLabels: true,
          interval: 5,
          stepDuration: const SliderStepDuration(years: 5),
          dateFormat: DateFormat.y(),
          labelPlacement: LabelPlacement.onTicks,
          dateIntervalType: DateIntervalType.years,
          showTicks: true,
          values: _yearValues,
          onChanged: (SfRangeValues values) {
            setState(() {
              _yearValues = values;
            });
          },
          enableTooltip: true,
          tooltipTextFormatterCallback:
              (dynamic actualLabel, String formattedText) {
            return DateFormat.yMMM().format(actualLabel);
          },
        ));
  }

  SfRangeSliderTheme _numericRangeSlider() {
    return SfRangeSliderTheme(
        data: SfRangeSliderThemeData(),
        child: SfRangeSlider.vertical(
            showLabels: true,
            interval: 25,
            min: -50.0,
            max: 50.0,
            stepSize: 25,
            showTicks: true,
            values: _values,
            onChanged: (SfRangeValues values) {
              setState(() {
                _values = values;
              });
            },
            enableTooltip: true));
  }

  Widget _buildMobileLayout() {
    final double padding = MediaQuery.of(context).size.height / 10.0;
    return Padding(
        padding: EdgeInsets.all(padding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Column(children: <Widget>[
              Expanded(child: _numericRangeSlider()),
              const Text('Numeric')
            ]),
            Column(children: <Widget>[
              Expanded(child: _yearRangeSlider()),
              const Text('DateTime')
            ]),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return _buildMobileLayout();
  }
}
