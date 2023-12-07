/*
* File : Triangle Clipper
* Version : 1.0.0
* */

import 'package:yoven/helpers/theme/app_theme.dart';
import 'package:yoven/helpers/widgets/my_spacing.dart';
import 'package:yoven/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:lucide_icons/lucide_icons.dart';

class TriangleClipper extends StatefulWidget {
  @override
  _TriangleClipperState createState() => _TriangleClipperState();
}

class _TriangleClipperState extends State<TriangleClipper> {
  late ThemeData theme;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);
    return GetBuilder(
      tag: 'triangle_clipper',
      builder: (controller) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: theme,
            home: Scaffold(
                appBar: AppBar(
                  leading: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(LucideIcons.chevronLeft),
                  ),
                  title: MyText.titleLarge("Triangle Clipper", fontWeight: 600),
                ),
                body: Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  color: theme.colorScheme.primary,
                  child: Stack(
                    children: <Widget>[
                      ClipPath(
                          clipper: _Clipper(),
                          child: Container(
                            alignment: Alignment.center,
                            color: theme.colorScheme.background,
                          )),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                            margin: MySpacing.top(16),
                            child: Text(
                              "Out Clipper",
                              style: theme.textTheme.titleMedium!.merge(
                                  TextStyle(
                                      color: theme.colorScheme.onBackground)),
                            )),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                            margin: MySpacing.bottom(16),
                            child: Text(
                              "On Clipper",
                              style: theme.textTheme.titleMedium!.merge(
                                  TextStyle(
                                      color: theme.colorScheme.onPrimary)),
                            )),
                      ),
                    ],
                  ),
                )));
      },
    );
  }
}

class _Clipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width * 0.5, size.height * 0.5);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}
