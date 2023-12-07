/*
* File : Perspective Transform
* Version : 1.0.0
* */

import 'package:yoven/helpers/theme/app_theme.dart';
import 'package:yoven/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:lucide_icons/lucide_icons.dart';

class PerspectiveTransformWidget extends StatefulWidget {
  @override
  _PerspectiveTransformWidgetState createState() =>
      _PerspectiveTransformWidgetState();
}

class _PerspectiveTransformWidgetState
    extends State<PerspectiveTransformWidget> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  Offset _offset = Offset.zero; // changed

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      tag: 'perspective_transform_widget',
      builder: (controller) {
        return Transform(
            // Transform widget
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001) // perspective
              ..rotateX(0.01 * _offset.dy) // changed
              ..rotateY(-0.01 * _offset.dx), // changed
            alignment: FractionalOffset.center,
            child: GestureDetector(
              // new
              onPanUpdate: (details) =>
                  setState(() => _offset += details.delta),
              onDoubleTap: () => setState(() => _offset = Offset.zero),
              child: Scaffold(
                appBar: AppBar(
                  elevation: 0,
                  leading: InkWell(
                    onTap: () => Navigator.of(context).pop(),
                    child: Icon(
                      LucideIcons.chevronLeft,
                      size: 20,
                    ),
                  ),
                  title: MyText.titleLarge('Perspective Transform',
                      fontWeight: 600), // changed
                ),
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MyText.titleSmall(
                        'Swipe your finger to screen',
                      ),
                    ],
                  ),
                ),
                floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  tooltip: 'Back Button',
                  child: Icon(LucideIcons.chevronLeft),
                ),
              ),
            ));
      },
    );
  }
}
