/*
* File : Image Post Dialog
* Version : 1.0.0
* */

import 'package:jambicraff/helpers/theme/app_theme.dart';
import 'package:jambicraff/helpers/widgets/my_button.dart';
import 'package:jambicraff/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class ImagePostDialogWidget extends StatefulWidget {
  @override
  _ImagePostDialogWidgetState createState() => _ImagePostDialogWidgetState();
}

class _ImagePostDialogWidgetState extends State<ImagePostDialogWidget> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
    WidgetsBinding.instance.addPostFrameCallback((_) => _showDialog());
  }

  void _showDialog() {
    showDialog(
        context: context, builder: (BuildContext context) => _FullDialog());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: Icon(
              LucideIcons.chevronLeft,
              size: 20,
            ),
          ),
          title: MyText.titleMedium("Image Post", fontWeight: 600),
        ),
        body: Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              boxShadow: [
                BoxShadow(
                  color: theme.colorScheme.primary.withAlpha(20),
                  blurRadius: 2,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: MyButton(
                elevation: 2,
                borderRadiusAll: 4,
                onPressed: () {
                  _showDialog();
                },
                child: MyText.bodyMedium("View Post",
                    fontWeight: 600,
                    color: theme.colorScheme.onPrimary,
                    letterSpacing: 0.2)),
          ),
        ));
  }
}

class _FullDialog extends StatelessWidget {
  final String description =
      "Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero's De Finibus Bonorum et Malorum for use in a type specimen book.";

  @override
  Widget build(BuildContext context) {
    ThemeData theme = AppTheme.theme;
    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      body: ListView(
        padding: EdgeInsets.all(0),
        children: <Widget>[
          Stack(children: [
            Image(
              image: AssetImage("./assets/images/all/all-p1.jpg"),
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height * 0.45,
            ),
            Positioned(
                top: 24,
                left: 18,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(LucideIcons.chevronLeft, color: Colors.white),
                )),
            Positioned(
              right: 16,
              bottom: 16,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ClipOval(
                    child: Material(
                      color: Colors.white.withAlpha(72),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28),
                          side: BorderSide(width: 0)),
                      child: InkWell(
                        splashColor: Colors.white.withAlpha(100),
                        highlightColor: Colors.white.withAlpha(72),
                        child: SizedBox(
                            width: 44,
                            height: 44,
                            child: Icon(
                              LucideIcons.heart,
                              color: Colors.white,
                              size: 22,
                            )),
                        onTap: () {},
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 8),
                    child: ClipOval(
                      child: Material(
                        color: Colors.white.withAlpha(72),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(28),
                            side: BorderSide(width: 0)),
                        child: InkWell(
                          splashColor: Colors.white.withAlpha(100),
                          highlightColor: Colors.white.withAlpha(72),
                          child: SizedBox(
                              width: 44,
                              height: 44,
                              child: Icon(
                                LucideIcons.share,
                                color: Colors.white,
                                size: 22,
                              )),
                          onTap: () {},
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ]),
          Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                MyText.headlineSmall("How do you get up and go forward",
                    fontWeight: 700),
                Container(
                    margin: EdgeInsets.only(top: 8),
                    child: MyText.bodyMedium(description,
                        fontWeight: 500, height: 1.2)),
                Container(
                  margin: EdgeInsets.only(top: 16),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 56,
                        height: 56,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage(
                                  './assets/images/profile/avatar_4.jpg'),
                              fit: BoxFit.fill),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              MyText.titleMedium("Zakariyah Cline",
                                  fontWeight: 600),
                              MyText.titleSmall("@zaka_cline", fontWeight: 500)
                            ],
                          ),
                        ),
                      ),
                      MyText.bodyLarge("26 May", fontWeight: 600),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
