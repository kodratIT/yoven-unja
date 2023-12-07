/*
* File : Top Navigation widget
* Version : 1.0.0
* Description :
* */

import 'package:jambicraff/helpers/widgets/my_spacing.dart';
import 'package:jambicraff/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class SliderLabelScreen extends StatefulWidget {
  @override
  _SliderLabelScreenState createState() => _SliderLabelScreenState();
}

class _SliderLabelScreenState extends State<SliderLabelScreen> {
  double _labelSliderValue = 50;
  double _tickSliderValue = 0;
  double _dividerSliderValue = 50;

  SfSliderTheme _sliderWithLabelCustomization() {
    return SfSliderTheme(
        data: SfSliderThemeData(),
        child: SfSlider(
          showLabels: true,
          interval: 20,
          min: 0.0,
          max: 100.0,
          value: _labelSliderValue,
          onChanged: (dynamic values) {
            setState(() {
              _labelSliderValue = values as double;
            });
          },
          enableTooltip: true,
          numberFormat: NumberFormat('#'),
        ));
  }

  SfSliderTheme _sliderWithTickCustomization() {
    return SfSliderTheme(
        data: SfSliderThemeData(),
        child: SfSlider(
          showLabels: true,
          showTicks: true,
          interval: 25,
          min: -50.0,
          max: 50.0,
          value: _tickSliderValue,
          onChanged: (dynamic values) {
            setState(() {
              _tickSliderValue = values as double;
            });
          },
          enableTooltip: true,
          numberFormat: NumberFormat('#'),
        ));
  }

  SfSliderTheme _sliderWithDividerCustomization() {
    return SfSliderTheme(
        data: SfSliderThemeData(),
        child: SfSlider(
          interval: 25,
          showDividers: true,
          min: 0.0,
          max: 100.0,
          value: _dividerSliderValue,
          onChanged: (dynamic values) {
            setState(() {
              _dividerSliderValue = values as double;
            });
          },
          enableTooltip: true,
          numberFormat: NumberFormat('#'),
        ));
  }

  Widget _buildMobileLayout() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        MyText.bodyMedium('Dividers'),
        _sliderWithDividerCustomization(),
        MySpacing.height(24),
        MyText.bodyMedium('Labels'),
        _sliderWithLabelCustomization(),
        MySpacing.height(24),
        MyText.bodyMedium('Ticks'),
        _sliderWithTickCustomization(),
        MySpacing.height(24),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildMobileLayout();
  }
}
