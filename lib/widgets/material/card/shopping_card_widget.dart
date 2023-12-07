/*
* File : Shopping Products Card
* Version : 1.0.0
* */

import 'package:yoven/helpers/theme/app_theme.dart';
import 'package:yoven/helpers/utils/generator.dart';
import 'package:yoven/helpers/widgets/my_container.dart';
import 'package:yoven/helpers/widgets/my_star_rating.dart';
import 'package:yoven/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class ShoppingCardWidget extends StatefulWidget {
  @override
  _ShoppingCardWidgetState createState() => _ShoppingCardWidgetState();
}

class _ShoppingCardWidgetState extends State<ShoppingCardWidget> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
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
          title: MyText.titleMedium("Shopping", fontWeight: 600),
        ),
        body: ListView(
          padding: EdgeInsets.only(left: 16, right: 16),
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(top: 0),
                child: _ProductListWidget(
                  name: "Cosmic bang",
                  image: './assets/images/apps/shopping/product/product-7.jpg',
                  shopName: 'Den cosmics',
                  star: 4.5,
                  price: 12000,
                  buildContext: context,
                )),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: _ProductListWidget(
                name: "Colorful sandal",
                image: './assets/images/apps/shopping/product/product-8.jpg',
                shopName: 'Lee Shop',
                star: 3.8,
                price: 14780,
                buildContext: context,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: _ProductListWidget(
                name: "Yellow cake",
                image: './assets/images/apps/shopping/product/product-1.jpg',
                shopName: 'Agus Bakery',
                buildContext: context,
                star: 4,
                price: 15000,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 16, bottom: 16),
              child: _ProductListWidget(
                name: "Toffees",
                image: './assets/images/apps/shopping/product/product-2.jpg',
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
    return MyContainer(
      padding: EdgeInsets.all(16),
      child: Row(
        children: <Widget>[
          Hero(
            tag: key,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              child: Image.asset(
                widget.image,
                height: 90.0,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 90,
              margin: EdgeInsets.only(left: 16),
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
                        LucideIcons.heart,
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
                      Container(
                        margin: EdgeInsets.only(left: 4),
                        child: MyText.bodyLarge(widget.star.toString(),
                            fontWeight: 700),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(
                            LucideIcons.store,
                            color:
                                theme.colorScheme.onBackground.withAlpha(200),
                            size: 20,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 4),
                            child: MyText.bodyMedium(widget.shopName,
                                color: theme.colorScheme.onBackground
                                    .withAlpha(200),
                                fontWeight: 500),
                          )
                        ],
                      ),
                      MyText.bodyMedium("\$ ${widget.price}", fontWeight: 700)
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
