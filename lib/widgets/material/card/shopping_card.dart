/*
* File : Shopping Products Card
* Version : 1.0.0
* */

import 'package:yoven/helpers/theme/app_theme.dart';
import 'package:yoven/helpers/utils/generator.dart';
import 'package:yoven/helpers/utils/my_shadow.dart';
import 'package:yoven/helpers/widgets/my_card.dart';
import 'package:yoven/helpers/widgets/my_container.dart';
import 'package:yoven/helpers/widgets/my_spacing.dart';
import 'package:yoven/helpers/widgets/my_star_rating.dart';
import 'package:yoven/helpers/widgets/my_text.dart';
import 'package:yoven/images.dart';
import 'package:flutter/material.dart';

class ShoppingCard extends StatefulWidget {
  @override
  _ShoppingCardState createState() => _ShoppingCardState();
}

class _ShoppingCardState extends State<ShoppingCard> {
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
        body: ListView(
      padding: MySpacing.x(16),
      children: <Widget>[
        Container(
            margin: MySpacing.top(24),
            child: _ProductListWidget(
              name: "Cosmic bang",
              image: Images.squares[0],
              shopName: 'Den cosmics',
              star: 4.5,
              price: 12000,
              buildContext: context,
            )),
        Container(
          margin: MySpacing.top(16),
          child: _ProductListWidget(
            name: "Colorful sandal",
            image: Images.squares[1],
            shopName: 'Lee Shop',
            star: 3.8,
            price: 14780,
            buildContext: context,
          ),
        ),
        Container(
          margin: MySpacing.top(16),
          child: _ProductListWidget(
            name: "Yellow cake",
            image: Images.squares[2],
            shopName: 'Agus Bakery',
            buildContext: context,
            star: 4,
            price: 15000,
          ),
        ),
        Container(
          margin: MySpacing.y(16),
          child: _ProductListWidget(
            name: "Toffees",
            image: Images.squares[3],
            shopName: 'Toffee Bakery',
            buildContext: context,
            star: 5,
            price: 12500,
          ),
        ),
      ],
    ));
  }
}

class _ProductListWidget extends StatefulWidget {
  final String name, image, shopName;
  final double star;
  final int price;
  final BuildContext buildContext;

  const _ProductListWidget(
      {Key? key,
      required this.name,
      required this.image,
      required this.shopName,
      required this.star,
      required this.price,
      required this.buildContext})
      : super(key: key);

  @override
  __ProductListWidgetState createState() => __ProductListWidgetState();
}

class __ProductListWidgetState extends State<_ProductListWidget> {
  late ThemeData theme;

  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);
    String key = Generator.randomString(10);
    return MyCard(
      shadow: MyShadow(elevation: 1),
      child: Row(
        children: <Widget>[
          Hero(
            tag: key,
            child: MyContainer(
              height: 90,
              width: 90,
              paddingAll: 0,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              borderRadius: BorderRadius.all(Radius.circular(8)),
              child: Image.asset(
                widget.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          MySpacing.width(20),
          Expanded(
            child: Container(
              height: 90,
              margin: MySpacing.left(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      MyText.titleMedium(widget.name,
                          fontWeight: 700, letterSpacing: 0),
                      Icon(
                        Icons.favorite_outline,
                        color: theme.colorScheme.onBackground.withAlpha(80),
                        size: 22,
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      MyStarRating(
                          rating: widget.star,
                          size: 16,
                          inactiveColor: theme.colorScheme.onBackground),
                      MySpacing.width(4),
                      MyText.bodyLarge(widget.star.toString(), fontWeight: 700),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.store_outlined,
                            color:
                                theme.colorScheme.onBackground.withAlpha(200),
                            size: 20,
                          ),
                          MySpacing.width(8),
                          MyText.bodyMedium(widget.shopName,
                              color:
                                  theme.colorScheme.onBackground.withAlpha(200),
                              fontWeight: 500),
                        ],
                      ),
                      MyText.bodyMedium("\$ ${widget.price}", fontWeight: 700),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
