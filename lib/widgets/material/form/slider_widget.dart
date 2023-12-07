/*
* File : Slider
* Version : 1.0.0
* */

import 'package:jambicraff/helpers/theme/app_theme.dart';
import 'package:jambicraff/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:lucide_icons/lucide_icons.dart';

class SliderWidget extends StatefulWidget {
  @override
  _SliderWidgetState createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  double _sliderValue1 = 30;
  double _sliderValue2 = 60;
  double _starValue = 10;
  double _endValue = 80;

  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      tag: 'slider_widget',
      builder: (controller) {
        return Scaffold(
            key: _scaffoldKey,
            appBar: AppBar(
              elevation: 0,
              leading: InkWell(
                onTap: () => Navigator.of(context).pop(),
                child: Icon(
                  LucideIcons.chevronLeft,
                  size: 20,
                ),
              ),
              title: MyText.titleMedium("Sliders", fontWeight: 600),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding:
                      EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 0),
                  child: MyText.titleMedium("Slider",
                      fontWeight: 600, letterSpacing: 0.2),
                ),
                Slider(
                  value: _sliderValue1,
                  onChanged: (value) {
                    setState(() {
                      _sliderValue1 = value;
                    });
                  },
                  min: 0,
                  max: 100,
                ),
                Container(
                  padding:
                      EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 0),
                  child: MyText.titleMedium("Labeled Slider",
                      fontWeight: 600, letterSpacing: 0.2),
                ),
                Slider(
                  value: _sliderValue2,
                  min: 0,
                  max: 100,
                  divisions: 100,
                  label: _sliderValue2.floor().toString(),
                  onChanged: (value) {
                    setState(
                      () {
                        _sliderValue2 = value;
                      },
                    );
                  },
                ),
                Container(
                  padding:
                      EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 0),
                  child: MyText.titleMedium("Range Slider",
                      fontWeight: 600, letterSpacing: 0.2),
                ),
                RangeSlider(
                  values: RangeValues(_starValue, _endValue),
                  min: 0.0,
                  max: 100.0,
                  onChanged: (values) {
                    setState(() {
                      _starValue = values.start.roundToDouble();
                      _endValue = values.end.roundToDouble();
                    });
                  },
                  activeColor: theme.sliderTheme.activeTrackColor,
                  inactiveColor: theme.sliderTheme.inactiveTrackColor,
                ),
              ],
            ));
      },
    );
  }

  void showSnackbarWithFloating(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: MyText.titleSmall(message, color: theme.colorScheme.onPrimary),
        backgroundColor: theme.colorScheme.primary,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
