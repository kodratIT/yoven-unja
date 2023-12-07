/*
* File : Text Liquid Fill
* Version : 1.0.0
* */

import 'package:jambicraff/helpers/theme/app_theme.dart';
import 'package:flutter/material.dart';

class InteractiveViewerWidget extends StatefulWidget {
  @override
  _InteractiveViewerWidgetState createState() =>
      _InteractiveViewerWidgetState();
}

class _InteractiveViewerWidgetState extends State<InteractiveViewerWidget> {
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
    return Scaffold(
        backgroundColor: Colors.black,
        body: InteractiveViewer(
          maxScale: 5.0,
          minScale: 0.2,
          boundaryMargin: EdgeInsets.all(5.0),
          child: Image.asset('./assets/images/all/all-1.jpg'),
        ));
  }
}
