/*
* File : Image Post Dialog
* Version : 1.0.0
* */

import 'package:jambicraff/helpers/theme/app_theme.dart';
import 'package:jambicraff/helpers/widgets/my_button.dart';
import 'package:jambicraff/helpers/widgets/my_spacing.dart';
import 'package:jambicraff/helpers/widgets/my_text.dart';
import 'package:jambicraff/images.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class PostDialog extends StatefulWidget {
  @override
  _PostDialogState createState() => _PostDialogState();
}

class _PostDialogState extends State<PostDialog> {
  late ThemeData theme;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  void _showDialog() {
    showDialog(
        context: context, builder: (BuildContext context) => _FullDialog());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: MyButton(
          onPressed: () {
            _showDialog();
          },
          elevation: 0,
          borderRadiusAll: 4,
          padding: MySpacing.xy(18, 16),
          child: MyText.bodyMedium("View Post",
              fontWeight: 600,
              color: theme.colorScheme.onPrimary,
              letterSpacing: 0.2)),
    ));
  }
}

class _FullDialog extends StatelessWidget {
  final String description =
      "Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero's De Finibus Bonorum et Malorum for use in a type specimen book.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: MySpacing.all(0),
        children: <Widget>[
          Stack(children: [
            Image(
              image: AssetImage(Images.portraits[0]),
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
                              Icons.favorite_outline,
                              color: Colors.white,
                              size: 22,
                            )),
                        onTap: () {},
                      ),
                    ),
                  ),
                  MySpacing.width(8),
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
                              Icons.share_outlined,
                              color: Colors.white,
                              size: 22,
                            )),
                        onTap: () {},
                      ),
                    ),
                  ),
                ],
              ),
            )
          ]),
          Container(
            padding: MySpacing.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                MyText.headlineSmall("How do you get up and go forward",
                    fontWeight: 700),
                Container(
                    margin: MySpacing.only(top: 8),
                    child: MyText.bodyMedium(description,
                        fontWeight: 500, height: 1.2)),
                Container(
                  margin: MySpacing.top(16),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 56,
                        height: 56,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage(Images.profiles[0]),
                              fit: BoxFit.fill),
                        ),
                      ),
                      MySpacing.width(16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            MyText.titleMedium("Zakariyah Cline",
                                fontWeight: 600),
                            MyText.titleSmall("@zaka_cline", fontWeight: 500),
                          ],
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
