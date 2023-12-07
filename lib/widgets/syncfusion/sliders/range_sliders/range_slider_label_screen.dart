import 'package:yoven/helpers/widgets/my_spacing.dart';
import 'package:yoven/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class RangeSliderLabelScreen extends StatefulWidget {
  @override
  _RangeSliderLabelScreenState createState() => _RangeSliderLabelScreenState();
}

class _RangeSliderLabelScreenState extends State<RangeSliderLabelScreen> {
  SfRangeValues _divisonSliderValues = SfRangeValues(20.0, 80.0);
  SfRangeValues _tickSliderValues = SfRangeValues(20.0, 80.0);
  SfRangeValues _labelSliderValues = SfRangeValues(20.0, 80.0);

  SfRangeSlider _sliderWithDivider() {
    return SfRangeSlider(
        min: 0.0,
        max: 100.0,
        interval: 20,
        showDividers: true,
        values: _divisonSliderValues,
        onChanged: (SfRangeValues values) {
          setState(() {
            _divisonSliderValues = values;
          });
        });
  }

  SfRangeSlider _sliderWithTick() {
    return SfRangeSlider(
        min: 0.0,
        max: 100.0,
        interval: 20,
        showLabels: true,
        showTicks: true,
        minorTicksPerInterval: 1,
        labelPlacement: LabelPlacement.onTicks,
        values: _tickSliderValues,
        onChanged: (SfRangeValues values) {
          setState(() {
            _tickSliderValues = values;
          });
        });
  }

  SfRangeSlider _sliderWithLabel() {
    return SfRangeSlider(
        min: 0.0,
        max: 100.0,
        interval: 20,
        showLabels: true,
        values: _labelSliderValues,
        onChanged: (SfRangeValues values) {
          setState(() {
            _labelSliderValues = values;
          });
        });
  }

  Widget _buildMobileLayout() {
    final double padding = MediaQuery.of(context).size.width / 20.0;
    return Container(
        padding: EdgeInsets.fromLTRB(padding, 0, padding, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MyText.bodyMedium('Dividers'),
            _sliderWithDivider(),
            MySpacing.height(24),
            MyText.bodyMedium('Labels'),
            _sliderWithLabel(),
            MySpacing.height(24),
            MyText.bodyMedium('Ticks'),
            _sliderWithTick(),
            MySpacing.height(24),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return _buildMobileLayout();
  }
}
