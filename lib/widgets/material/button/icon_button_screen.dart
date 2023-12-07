/*
* File : Icon Button
* Version : 1.0.0
* */

import 'package:yoven/helpers/theme/app_theme.dart';
import 'package:yoven/helpers/widgets/my_spacing.dart';
import 'package:yoven/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';

class IconButtonScreen extends StatefulWidget {
  @override
  _WidgetState createState() => _WidgetState();
}

class _WidgetState extends State<IconButtonScreen> {
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
    return Scaffold(
        body: Container(
            color: theme.colorScheme.background,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: <Widget>[
                Container(
                  margin: MySpacing.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: 8),
                        child: MyText.titleSmall("Filled Buttons",
                            color: theme.colorScheme.onBackground),
                      ),
                      Row(
                        children: <Widget>[
                          ClipOval(
                            child: Material(
                              color: Colors.blue, // button color
                              child: InkWell(
                                splashColor: Colors.white,
                                // inkwell color
                                child: SizedBox(
                                    width: 56,
                                    height: 56,
                                    child: Icon(Icons.add)),
                                onTap: () {},
                              ),
                            ),
                          ),
                          MySpacing.width(20),
                          ClipOval(
                            child: Material(
                              color: Colors.green,
                              child: InkWell(
                                splashColor: Colors.white,
                                // inkwell color
                                child: SizedBox(
                                    width: 56,
                                    height: 56,
                                    child: Icon(Icons.menu)),
                                onTap: () {},
                              ),
                            ),
                          ),
                          MySpacing.width(20),
                          ClipOval(
                            child: Material(
                              color: Colors.red, // button color
                              child: InkWell(
                                splashColor: Colors.white,
                                // inkwell color
                                child: SizedBox(
                                    width: 56,
                                    height: 56,
                                    child: Icon(Icons.share)),
                                onTap: () {},
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: MySpacing.fromLTRB(0, 16, 0, 8),
                        child: MyText.titleSmall("Outline Buttons",
                            color: theme.colorScheme.onBackground),
                      ),
                      Row(
                        children: <Widget>[
                          ClipOval(
                            child: Material(
                              color: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(28),
                                  side: BorderSide(color: Colors.blue)),
                              child: InkWell(
                                splashColor: Colors.blue,
                                // inkwell color
                                child: SizedBox(
                                    width: 56,
                                    height: 56,
                                    child: Icon(
                                      Icons.add,
                                      color: theme.colorScheme.onBackground,
                                    )),
                                onTap: () {},
                              ),
                            ),
                          ),
                          MySpacing.width(20),
                          ClipOval(
                            child: Material(
                              color: Colors.transparent, // button color
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(28),
                                  side: BorderSide(color: Colors.green)),
                              child: InkWell(
                                splashColor: Colors.green,
                                child: SizedBox(
                                    width: 56,
                                    height: 56,
                                    child: Icon(
                                      Icons.menu,
                                      color: theme.colorScheme.onBackground,
                                    )),
                                onTap: () {},
                              ),
                            ),
                          ),
                          MySpacing.width(20),
                          ClipOval(
                            child: Material(
                              color: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(28),
                                  side: BorderSide(color: Colors.red)),
                              child: InkWell(
                                splashColor: Colors.red,
                                child: SizedBox(
                                    width: 56,
                                    height: 56,
                                    child: Icon(
                                      Icons.share,
                                      color: theme.colorScheme.onBackground,
                                    )),
                                onTap: () {},
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )));
  }
}
