/*
* File : Product Search
* Version : 1.0.0
* */

import 'dart:async';

import 'package:jambicraff/helpers/theme/app_theme.dart';
import 'package:jambicraff/helpers/utils/generator.dart';
import 'package:jambicraff/helpers/widgets/my_spacing.dart';
import 'package:jambicraff/helpers/widgets/my_star_rating.dart';
import 'package:jambicraff/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:lucide_icons/lucide_icons.dart';

class ProductsSearchWidget extends StatefulWidget {
  @override
  _ProductsSearchWidgetState createState() => _ProductsSearchWidgetState();
}

class _ProductsSearchWidgetState extends State<ProductsSearchWidget> {
  bool _isInProgress = false;
  Timer? _timer;
  late ThemeData theme;
  late CustomTheme customTheme;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => startTimer());

    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  void _onSubmit(text) {
    startTimer();
  }

  void startTimer() {
    setState(() {
      _isInProgress = true;
    });
    const oneSec = const Duration(milliseconds: 2500);
    _timer = Timer.periodic(
        oneSec,
        (Timer timer) => {
              _timer!.cancel(),
              setState(
                () {
                  _isInProgress = false;
                },
              )
            });
  }

  @override
  void dispose() {
    super.dispose();
    if (_timer != null) _timer!.cancel();
  }

  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);
    return GetBuilder(
      builder: (controller) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: theme,
            home: Scaffold(
                body: Column(
              children: <Widget>[
                MySpacing.height(32),
                Container(
                  margin: MySpacing.all(16),
                  child: Card(
                    elevation: 2,
                    child: Padding(
                      padding: MySpacing.xy(12, 8),
                      child: Row(
                        children: <Widget>[
                          GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(
                                LucideIcons.chevronLeft,
                                size: 24,
                                color: theme.colorScheme.onBackground
                                    .withAlpha(240),
                              )),
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: MySpacing.fromLTRB(16, 0, 8, 0),
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: "Try to search",
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  focusedErrorBorder: InputBorder.none,
                                  isDense: true,
                                ),
                                autofocus: false,
                                maxLines: 1,
                                textInputAction: TextInputAction.search,
                                textCapitalization:
                                    TextCapitalization.sentences,
                                onSubmitted: _onSubmit,
                              ),
                            ),
                          ),
                          CircleAvatar(
                            radius: 16,
                            backgroundColor: theme.colorScheme.secondary,
                            child: MyText.titleSmall("A",
                                color: theme.colorScheme.onSecondary),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: _isInProgress
                      ? Center(
                          child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                            theme.colorScheme.primary,
                          )),
                        )
                      : Container(
                          color: theme.colorScheme.background,
                          child: ListView(
                            padding: MySpacing.all(0),
                            children: <Widget>[
                              Container(
                                padding: MySpacing.x(16),
                                child: MyText.bodyMedium("RESULT",
                                    fontWeight: 600),
                              ),
                              Container(
                                padding: MySpacing.nBottom(16),
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                        child: Container(
                                      margin: MySpacing.right(8),
                                      child: _SimpleCard(
                                        image:
                                            './assets/images/shopping/product/product-7.jpg',
                                        name: 'Product-1',
                                        description:
                                            'Lorem ipsum, or lipsum as it is sometimes',
                                        star: 4,
                                        countStar: 15,
                                      ),
                                    )),
                                    Expanded(
                                        child: Container(
                                      margin: MySpacing.left(8),
                                      child: _SimpleCard(
                                        image:
                                            './assets/images/shopping/product/product-8.jpg',
                                        name: 'Product-1',
                                        description:
                                            'Lorem ipsum, or lipsum as it is sometimes',
                                        star: 5,
                                        countStar: 2,
                                      ),
                                    )),
                                  ],
                                ),
                              ),
                              Container(
                                padding: MySpacing.fromLTRB(16, 16, 16, 4),
                                child: MyText.bodyMedium("RECOMMENDED",
                                    fontWeight: 600),
                              ),
                              Container(
                                margin: MySpacing.top(8),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        margin: MySpacing.fromLTRB(16, 0, 0, 8),
                                        child: _SimpleCard(
                                          image:
                                              './assets/images/shopping/product/product-3.jpg',
                                          name: 'Product-1',
                                          description:
                                              'Lorem ipsum, or lipsum as it is sometimes',
                                          star: 4,
                                          countStar: 15,
                                          width: 160,
                                        ),
                                      ),
                                      Container(
                                        margin: MySpacing.fromLTRB(16, 0, 0, 8),
                                        child: _SimpleCard(
                                          image:
                                              './assets/images/shopping/product/product-5.jpg',
                                          name: 'Product-1',
                                          description:
                                              'Lorem ipsum, or lipsum as it is sometimes',
                                          star: 5,
                                          countStar: 2,
                                          width: 160,
                                        ),
                                      ),
                                      Container(
                                        margin:
                                            MySpacing.fromLTRB(16, 0, 16, 8),
                                        child: _SimpleCard(
                                          image:
                                              './assets/images/shopping/product/product-2.jpg',
                                          name: 'Product-1',
                                          description:
                                              'Lorem ipsum, or lipsum as it is sometimes',
                                          star: 5,
                                          countStar: 2,
                                          width: 160,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )),
                ),
              ],
            )));
      },
    );
  }
}

class _SimpleCard extends StatefulWidget {
  final String? image, name, description;
  final int? star, countStar;
  final double? width;

  const _SimpleCard({
    Key? key,
    this.image,
    this.name,
    this.description,
    this.star,
    this.countStar,
    this.width,
  }) : super(key: key);

  @override
  _SimpleCardState createState() => _SimpleCardState();
}

class _SimpleCardState extends State<_SimpleCard> {
  late ThemeData theme;

  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);
    return Card(
      child: SizedBox(
        width: widget.width ?? MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image(
              image: AssetImage(widget.image!),
              width: widget.width ?? MediaQuery.of(context).size.width,
              fit: BoxFit.fill,
            ),
            Container(
              padding: MySpacing.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      MyText.bodyMedium(widget.name!, fontWeight: 600),
                      Container(
                        margin: MySpacing.top(2),
                        child: MyText.bodySmall(
                          widget.description!,
                          color: theme.colorScheme.onBackground,
                          letterSpacing: 0.15,
                          height: 1.2,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Container(
                        margin: MySpacing.top(2),
                        child: Row(
                          children: <Widget>[
                            MyStarRating(
                                rating: widget.star!.toDouble(),
                                inactiveColor: Generator.starColor),
                            Container(
                              margin: MySpacing.left(4),
                              child: MyText.bodyMedium("(${widget.countStar})",
                                  color: theme.colorScheme.onBackground,
                                  letterSpacing: 0.2),
                            )
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
      ),
    );
  }
}
