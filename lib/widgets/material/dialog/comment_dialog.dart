/*
* File : Comment Dialog
* Version : 1.0.0
* */

import 'package:yoven/images.dart';
import 'package:yoven/helpers/theme/app_theme.dart';
import 'package:yoven/helpers/utils/my_shadow.dart';
import 'package:yoven/helpers/widgets/my_card.dart';
import 'package:yoven/helpers/widgets/my_spacing.dart';
import 'package:yoven/helpers/widgets/my_text.dart';
import 'package:yoven/helpers/widgets/my_text_style.dart';
import 'package:flutter/material.dart';

class CommentDialog extends StatefulWidget {
  @override
  _CommentWidgetState createState() => _CommentWidgetState();
}

class _CommentWidgetState extends State<CommentDialog> {
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
        context: context, builder: (BuildContext context) => _CommentDialog());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: MyCard(
      onTap: () {
        _showDialog();
      },
      shadow: MyShadow(elevation: 4),
      marginAll: 8,
      paddingAll: 8,
      borderRadiusAll: 4,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image(
            image: AssetImage(Images.landscapes[0]),
            height: 220,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Container(
            padding: MySpacing.fromLTRB(12, 16, 12, 8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                MyText.titleMedium('At Mountain', fontWeight: 700),
                Container(
                  margin: MySpacing.top(8),
                  child: MyText.bodyMedium(
                      'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs.',
                      fontWeight: 500),
                ),
                Container(
                  margin: MySpacing.top(16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.favorite_outline,
                        color: theme.colorScheme.secondary,
                        size: 20,
                      ),
                      MySpacing.width(8),
                      MyText.bodySmall(220.toString(), fontWeight: 600),
                      Row(
                        children: <Widget>[
                          Container(
                              margin: MySpacing.left(16),
                              child: Icon(
                                Icons.comment,
                                color: theme.colorScheme.primary,
                                size: 20,
                              )),
                          MySpacing.width(8),
                          MyText.bodySmall('Comment', fontWeight: 600),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}

class _CommentDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Dialog(
      child: Container(
        padding: MySpacing.all(16),
        decoration: BoxDecoration(
          color: theme.colorScheme.background,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              offset: Offset(0.0, 10.0),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min, // To make the card compact
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(
                  Icons.thumb_up_alt_outlined,
                  color: theme.colorScheme.primary,
                ),
                MySpacing.width(16),
                RichText(
                  text: TextSpan(
                      style: MyTextStyle.titleSmall(),
                      children: <TextSpan>[
                        TextSpan(
                            text: "Will Allen",
                            style: MyTextStyle.titleSmall(fontWeight: 700)),
                        TextSpan(text: " and "),
                        TextSpan(
                            text: "17 others",
                            style: MyTextStyle.titleSmall(fontWeight: 700)),
                        TextSpan(text: " like this."),
                      ]),
                )
              ],
            ),
            Divider(),
            _SingleComment(
              name: 'Hamaad Brock',
              image: Images.profiles[0],
              comment: 'It\'s cool',
              time: '1 hour ago',
            ),
            _SingleComment(
              name: 'Roseanna Rowe',
              image: Images.profiles[1],
              comment: 'Niceeeee',
              time: '5 hour ago',
            ),
            _SingleComment(
              name: 'Zidane Brewer',
              image: Images.profiles[2],
              comment: 'Lorem ipsum, or lipsum as it is sometimes known',
              time: '3 days ago',
            ),
            Center(
              child: TextButton(
                  onPressed: () {},
                  child: MyText.labelMedium("View All",
                      fontWeight: 600, color: theme.colorScheme.primary)),
            )
          ],
        ),
      ),
    );
  }
}

class _SingleComment extends StatelessWidget {
  final String name, image, comment, time;

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Container(
      padding: MySpacing.y(8),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image:
                  DecorationImage(image: AssetImage(image), fit: BoxFit.fill),
            ),
          ),
          MySpacing.width(8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                MyText.titleSmall(
                  name,
                  fontWeight: 700,
                ),
                MyText.bodyMedium(
                  comment,
                  fontWeight: 500,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Row(
                  children: <Widget>[
                    MyText.bodySmall(time, fontWeight: 400, height: 1.2),
                    Container(
                        margin: MySpacing.left(8),
                        child: MyText.bodyMedium('Like',
                            color: themeData.colorScheme.primary,
                            fontWeight: 500)),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  const _SingleComment(
      {Key? key,
      required this.name,
      required this.image,
      required this.comment,
      required this.time})
      : super(key: key);
}
