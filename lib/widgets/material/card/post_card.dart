/*
* File : Image Post Card
* Version : 1.0.0
* */

import 'package:jambicraff/images.dart';
import 'package:jambicraff/helpers/theme/app_theme.dart';
import 'package:jambicraff/helpers/widgets/my_spacing.dart';
import 'package:jambicraff/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';

class PostCard extends StatefulWidget {
  @override
  _PostCardState createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  late ThemeData theme;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  final double _elevation = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      padding: EdgeInsets.all(0),
      children: <Widget>[
        Container(
          margin: MySpacing.fromLTRB(16, 16, 16, 0),
          child: MyText.bodyLarge("Recent Post", fontWeight: 600),
        ),
        Container(
          margin: MySpacing.fromLTRB(16, 16, 16, 0),
          child: _SimpleCard(
            elevation: _elevation,
            image: Images.landscapes[0],
            title: 'At Mountain',
            description:
                'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs.',
            like: 254,
            height: 220,
            view: 563,
          ),
        ),
        Container(
          margin: MySpacing.fromLTRB(16, 16, 16, 0),
          child: MyText.bodyLarge("Old Posts", fontWeight: 700),
        ),
        Container(
          margin: MySpacing.all(16),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  margin: MySpacing.right(8),
                  child: _SimpleCard(
                    elevation: _elevation,
                    image: Images.landscapes[1],
                    title: 'Ice',
                    description:
                        'Lorem ipsum, or lipsum as it is sometimes known',
                    like: 158,
                    view: 353,
                    height: 150,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: MySpacing.left(8),
                  child: _SimpleCard(
                    elevation: _elevation,
                    image: Images.landscapes[2],
                    title: 'With Nature',
                    height: 150,
                    description:
                        'Lorem ipsum, or lipsum as it is sometimes known',
                    like: 215,
                    view: 314,
                  ),
                ),
              )
            ],
          ),
        )
      ],
    ));
  }
}

class _SimpleCard extends StatefulWidget {
  final double elevation;
  final String? image, title, description;
  final int? like, view, height;

  const _SimpleCard(
      {Key? key,
      this.elevation = 1,
      this.image,
      this.title,
      this.description,
      this.like,
      this.view,
      this.height})
      : super(key: key);

  @override
  _SimpleCardState createState() => _SimpleCardState();
}

class _SimpleCardState extends State<_SimpleCard> {
  late ThemeData theme;

  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);
    return Card(
      margin: MySpacing.all(0),
      elevation: widget.elevation,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image(
            image: AssetImage(widget.image!),
            height: widget.height!.toDouble(),
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Container(
            padding: MySpacing.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    MyText.titleMedium(widget.title!, fontWeight: 600),
                    Container(
                      margin: MySpacing.top(2),
                      child: MyText.bodyMedium(widget.description!,
                          fontWeight: 500, height: 1.2),
                    ),
                    Container(
                      margin: MySpacing.top(8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.favorite_outline,
                            color: theme.colorScheme.secondary,
                            size: 20,
                          ),
                          MySpacing.width(16),
                          Container(
                            margin: EdgeInsets.only(left: 4),
                            child: MyText.bodySmall(widget.like.toString(),
                                fontWeight: 600),
                          ),
                          Container(
                              margin: EdgeInsets.only(left: 16),
                              child: Icon(
                                Icons.remove_red_eye_outlined,
                                color: theme.colorScheme.onBackground,
                                size: 20,
                              )),
                          Container(
                            margin: EdgeInsets.only(left: 4),
                            child: MyText.bodySmall(widget.view.toString(),
                                fontWeight: 600),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
