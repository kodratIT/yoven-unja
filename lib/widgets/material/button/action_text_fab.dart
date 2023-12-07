/*
* File : Action Text FAB
* Version : 1.0.0
* */

import 'dart:math';

import 'package:jambicraff/images.dart';
import 'package:jambicraff/helpers/theme/app_theme.dart';
import 'package:jambicraff/helpers/widgets/my_spacing.dart';
import 'package:jambicraff/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';

class ActionTextFAB extends StatefulWidget {
  @override
  _ActionTextFABState createState() => _ActionTextFABState();
}

class Contact {
  String name, number;

  Contact(this.name, this.number);
}

class _ActionTextFABState extends State<ActionTextFAB>
    with TickerProviderStateMixin {
  late ThemeData theme;

  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  late AnimationController _controller;
  double _contentOpacity = 1;

  static List<IconData> icons = [
    Icons.g_translate,
    Icons.facebook,
    Icons.whatshot_outlined
  ];
  static List<String> iconsText = ["Google", "Facebook", "WhatsApp"];

  final List<String> _imageList = Images.squares.sublist(0, 14);

  _generateGridItems() {
    List<Widget> list = [];
    for (int i = 0; i < 32; i++) {
      list.add(Image(image: AssetImage(_imageList[i % 14]), fit: BoxFit.fill));
    }
    return list;
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);
    return Scaffold(
        floatingActionButton: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: List.generate(icons.length, (int index) {
            Widget child = SizedBox(
              height: 70.0,
              width: MediaQuery.of(context).size.width,
              child: ScaleTransition(
                scale: CurvedAnimation(
                  parent: _controller,
                  curve: Interval(0.0, 1.0 - index / icons.length / 2.0,
                      curve: Curves.easeOutQuint),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      padding: MySpacing.xy(8, 4),
                      margin: EdgeInsets.only(right: 4),
                      color: theme.colorScheme.secondary,
                      child: MyText.bodyMedium(iconsText[index],
                          color: theme.colorScheme.onSecondary,
                          fontWeight: 500,
                          letterSpacing: 0.2),
                    ),
                    FloatingActionButton(
                      heroTag: null,
                      backgroundColor: theme.colorScheme.secondary,
                      mini: true,
                      child: Icon(icons[index],
                          color: theme.colorScheme.onSecondary),
                      onPressed: () {
                        showSimpleSnackBar();
                      },
                    ),
                  ],
                ),
              ),
            );
            return child;
          }).toList()
            ..add(
              FloatingActionButton(
                heroTag: null,
                backgroundColor: theme.colorScheme.primary,
                child: AnimatedBuilder(
                  animation: _controller,
                  builder: (BuildContext context, Widget? child) {
                    return Transform(
                      transform:
                          Matrix4.rotationZ(_controller.value * 0.5 * pi),
                      alignment: FractionalOffset.center,
                      child: Icon(
                        _controller.isDismissed ? Icons.share : Icons.close,
                        color: theme.colorScheme.onPrimary,
                      ),
                    );
                  },
                ),
                onPressed: () {
                  if (_controller.isDismissed) {
                    setState(() {
                      _contentOpacity = 0.6;
                    });
                    _controller.forward();
                  } else {
                    setState(() {
                      _contentOpacity = 1;
                    });
                    _controller.reverse();
                  }
                },
              ),
            ),
        ),
        body: Opacity(
          opacity: _contentOpacity,
          child: Container(
              margin: MySpacing.xy(4, 8),
              color: theme.colorScheme.background,
              child: GridView.count(
                  crossAxisCount: 2,
                  padding: MySpacing.all(4),
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  children: _generateGridItems())),
        ));
  }

  void showSimpleSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content:
            MyText.titleSmall("Sharing", color: theme.colorScheme.onPrimary),
        backgroundColor: theme.colorScheme.primary,
      ),
    );
  }
}
