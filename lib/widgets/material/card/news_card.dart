/*
* File : Full Page News Card
* Version : 1.0.0
* */

import 'package:yoven/images.dart';
import 'package:yoven/helpers/theme/app_theme.dart';
import 'package:yoven/helpers/widgets/my_button.dart';
import 'package:yoven/helpers/widgets/my_spacing.dart';
import 'package:yoven/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';

class NewsCard extends StatefulWidget {
  @override
  _NewsCardState createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  late ThemeData theme;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  final String _newsContent =
      "Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero's De Finibus Bonorum et Malorum for use in a type specimen book.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Card(
      elevation: 2,
      margin: MySpacing.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Image(
              image: AssetImage(Images.portraits[0]),
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: MySpacing.fromLTRB(24, 24, 24, 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    MyText.bodyMedium(
                      "March 20, 2020",
                      fontWeight: 700,
                    ),
                    Container(
                      margin: MySpacing.top(16),
                      child: MyText.titleLarge("What happened At CUBA?",
                          fontWeight: 700),
                    ),
                    Container(
                      margin: MySpacing.top(16),
                      child: MyText.bodyMedium(_newsContent,
                          fontWeight: 500, height: 1.2),
                    ),
                    Container(
                      margin: MySpacing.top(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Container(
                              margin: MySpacing.left(16),
                              child: Icon(
                                Icons.remove_red_eye_outlined,
                                color: theme.colorScheme.onBackground
                                    .withAlpha(200),
                                size: 20,
                              )),
                          Container(
                            margin: MySpacing.left(8),
                            child: MyText.bodySmall("220".toString(),
                                fontWeight: 600, letterSpacing: 0.3),
                          ),
                        ],
                      ),
                    ),
                    MySpacing.height(16),
                    Center(
                      child: MyButton(
                        elevation: 0,
                        borderRadiusAll: 4,
                        onPressed: () {},
                        child: MyText.bodyMedium("READ MORE",
                            fontWeight: 700,
                            color: theme.colorScheme.onPrimary),
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
