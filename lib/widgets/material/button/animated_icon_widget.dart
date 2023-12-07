/*
* File : Animated Icon
* Version : 1.0.0
* */

import 'package:yoven/helpers/theme/app_theme.dart';
import 'package:yoven/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class AnimatedIconWidget extends StatefulWidget {
  @override
  _AnimatedIconWidgetState createState() => _AnimatedIconWidgetState();
}

class _AnimatedIconWidgetState extends State<AnimatedIconWidget> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
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
            title: MyText.titleMedium("Animated Icon", fontWeight: 600)),
        body: Container(
            color: theme.colorScheme.background,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      MyText.titleSmall("Animated Icon", fontWeight: 600),
                      Container(
                        margin: EdgeInsets.only(top: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const <Widget>[
                            SingleAnimatedIcon(
                              animatedIconData: AnimatedIcons.play_pause,
                            ),
                            SingleAnimatedIcon(
                              animatedIconData: AnimatedIcons.add_event,
                            ),
                            SingleAnimatedIcon(
                              animatedIconData: AnimatedIcons.arrow_menu,
                            ),
                            SingleAnimatedIcon(
                              animatedIconData: AnimatedIcons.ellipsis_search,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const <Widget>[
                            SingleAnimatedIcon(
                              animatedIconData: AnimatedIcons.home_menu,
                            ),
                            SingleAnimatedIcon(
                              animatedIconData: AnimatedIcons.view_list,
                            ),
                            SingleAnimatedIcon(
                              animatedIconData: AnimatedIcons.menu_close,
                            ),
                            SingleAnimatedIcon(
                              animatedIconData: AnimatedIcons.menu_arrow,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const <Widget>[
                            SingleAnimatedIcon(
                              animatedIconData: AnimatedIcons.play_pause,
                              isBackground: true,
                            ),
                            SingleAnimatedIcon(
                              animatedIconData: AnimatedIcons.add_event,
                              isBackground: true,
                            ),
                            SingleAnimatedIcon(
                              animatedIconData: AnimatedIcons.arrow_menu,
                              isBackground: true,
                            ),
                            SingleAnimatedIcon(
                              animatedIconData: AnimatedIcons.ellipsis_search,
                              isBackground: true,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const <Widget>[
                            SingleAnimatedIcon(
                              animatedIconData: AnimatedIcons.home_menu,
                              isBackground: true,
                            ),
                            SingleAnimatedIcon(
                              animatedIconData: AnimatedIcons.view_list,
                              isBackground: true,
                            ),
                            SingleAnimatedIcon(
                              animatedIconData: AnimatedIcons.menu_close,
                              isBackground: true,
                            ),
                            SingleAnimatedIcon(
                              animatedIconData: AnimatedIcons.menu_arrow,
                              isBackground: true,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 24),
                        child:
                            MyText.titleSmall("Slow Motion", fontWeight: 600),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const <Widget>[
                            SingleAnimatedIcon(
                              animatedIconData: AnimatedIcons.play_pause,
                              isBackground: true,
                              isSlowMotion: true,
                            ),
                            SingleAnimatedIcon(
                                animatedIconData: AnimatedIcons.add_event,
                                isBackground: true,
                                isSlowMotion: true),
                            SingleAnimatedIcon(
                                animatedIconData: AnimatedIcons.arrow_menu,
                                isBackground: true,
                                isSlowMotion: true),
                            SingleAnimatedIcon(
                                animatedIconData: AnimatedIcons.ellipsis_search,
                                isBackground: true,
                                isSlowMotion: true),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const <Widget>[
                            SingleAnimatedIcon(
                                animatedIconData: AnimatedIcons.home_menu,
                                isBackground: true,
                                isSlowMotion: true),
                            SingleAnimatedIcon(
                                animatedIconData: AnimatedIcons.view_list,
                                isBackground: true,
                                isSlowMotion: true),
                            SingleAnimatedIcon(
                                animatedIconData: AnimatedIcons.menu_close,
                                isBackground: true,
                                isSlowMotion: true),
                            SingleAnimatedIcon(
                                animatedIconData: AnimatedIcons.menu_arrow,
                                isBackground: true,
                                isSlowMotion: true),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )));
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

class SingleAnimatedIcon extends StatefulWidget {
  final AnimatedIconData animatedIconData;
  final bool isBackground, isSlowMotion;

  const SingleAnimatedIcon(
      {Key? key,
      required this.animatedIconData,
      this.isBackground = false,
      this.isSlowMotion = false})
      : super(key: key);

  @override
  _SingleAnimatedIconState createState() => _SingleAnimatedIconState();
}

class _SingleAnimatedIconState extends State<SingleAnimatedIcon>
    with SingleTickerProviderStateMixin {
  late ThemeData theme;
  late AnimationController _animationController;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: widget.isSlowMotion ? 1500 : 400));
  }

  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);
    return ClipOval(
      child: Material(
        color: widget.isBackground
            ? theme.primaryColor.withAlpha(20)
            : Colors.transparent, // button color
        child: InkWell(
          splashColor: theme.colorScheme.primary,
          // inkwell color
          child: SizedBox(
              width: 44,
              height: 44,
              child: IconButton(
                iconSize: 24,
                icon: AnimatedIcon(
                  icon: widget.animatedIconData,
                  progress: _animationController,
                  color: theme.colorScheme.primary,
                ),
                onPressed: () {
                  if (isPlaying) {
                    _animationController.reverse();
                    setState(() {
                      isPlaying = false;
                    });
                  } else {
                    _animationController.forward();
                    setState(() {
                      isPlaying = true;
                    });
                  }
                },
              )),
          onTap: () {},
        ),
      ),
    );
  }
}
