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
  late ThemeData theme;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  Offset _offset = Offset.zero; // changed

  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);
    return GetBuilder(
      tag: 'perspective_transform_widget',
      builder: (controller) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: theme,
            home: Transform(
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
                      leading: IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: Icon(LucideIcons.chevronLeft),
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
                )));
      },
    );
  }
}
