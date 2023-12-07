/*
* File : ActionMyText FAB
* Version : 1.0.0
* */

import 'dart:math';

import 'package:jambicraff/helpers/theme/app_theme.dart';
import 'package:jambicraff/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ActionTextFABWidget extends StatefulWidget {
  @override
  _ActionTextFABWidgetState createState() => _ActionTextFABWidgetState();
}

class Contact {
  String name, number;

  Contact(this.name, this.number);
}

class _ActionTextFABWidgetState extends State<ActionTextFABWidget>
    with TickerProviderStateMixin {
  late ThemeData theme;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  late AnimationController _controller;
  double _contentOpacity = 1;

  static const List<IconData> icons = const [
    MdiIcons.google,
    LucideIcons.facebook,
    MdiIcons.whatsapp
  ];
  static const List<String> iconsText = const [
    "Google",
    "Facebook",
    "WhatsApp"
  ];

  final List<String> _imageList = [
    './assets/images/all/all-1.jpg',
    './assets/images/all/all-2.jpg',
    './assets/images/all/all-3.jpg',
    './assets/images/all/all-4.jpg',
    './assets/images/all/all-5.jpg',
    './assets/images/all/all-6.jpg',
    './assets/images/all/all-7.jpg',
    './assets/images/all/all-8.jpg',
    './assets/images/all/all-9.jpg',
    './assets/images/all/all-10.jpg',
    './assets/images/all/all-11.jpg',
    './assets/images/all/all-12.jpg',
    './assets/images/all/all-13.jpg',
    './assets/images/all/all-14.jpg',
  ];

  _generateGridItems() {
    List<Widget> list = [];
    for (int i = 0; i < 32; i++) {
      list.add(Image(image: AssetImage(_imageList[i % 14]), fit: BoxFit.fill));
    }
    return list;
  }

  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: theme.colorScheme.background,
        appBar: AppBar(
          elevation: 0,
          leading: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: Icon(
              LucideIcons.chevronLeft,
              size: 20,
            ),
          ),
          title: MyText.titleMedium("FAB with Action", fontWeight: 600),
        ),
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
                      padding:
                          EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
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
                        showSimpleSnackbar();
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
              margin: EdgeInsets.only(left: 4, right: 4, top: 8, bottom: 8),
              color: theme.colorScheme.background,
              child: GridView.count(
                  crossAxisCount: 2,
                  padding: EdgeInsets.all(4),
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  children: _generateGridItems())),
        ));
  }

  void showSimpleSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content:
            MyText.titleSmall("Sharing", color: theme.colorScheme.onPrimary),
        backgroundColor: theme.colorScheme.primary,
      ),
    );
  }
}
