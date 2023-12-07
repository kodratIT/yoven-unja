import 'package:jambicraff/helpers/theme/app_theme.dart';
import 'package:jambicraff/helpers/widgets/my_button.dart';
import 'package:jambicraff/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class DropdownWidget extends StatefulWidget {
  @override
  _DropdownWidgetState createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  late List<int> _cartQtyList;

  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
    _cartQtyList = [5, 2, 4];
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
          title: MyText.titleMedium("Dropdown", fontWeight: 600),
        ),
        key: _scaffoldKey,
        body: ListView(
          padding: EdgeInsets.only(left: 24, right: 24, top: 0),
          children: <Widget>[
            Column(
              children: <Widget>[
                singleCartItem(
                    image:
                        './assets/images/apps/shopping/product/product-5.jpg',
                    price: 39.99,
                    name: 'Seeds',
                    index: 0),
                singleCartItem(
                    image:
                        './assets/images/apps/shopping/product/product-7.jpg',
                    price: 24.99,
                    name: 'Forbes',
                    index: 1),
                singleCartItem(
                    image:
                        './assets/images/apps/shopping/product/product-8.jpg',
                    price: 12.99,
                    name: 'Sandals',
                    index: 2),
              ],
            ),
            Divider(
              height: 24,
            ),
            _CardBillWidget(),
            Container(
              margin: EdgeInsets.only(top: 24),
              child: MyButton(
                elevation: 2,
                borderRadiusAll: 4,
                onPressed: () {},
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Center(
                        child: MyText.titleMedium("\$ 449.89",
                            letterSpacing: 0.3,
                            color: theme.colorScheme.onPrimary),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: theme.colorScheme.primary,
                          shape: BoxShape.circle),
                      child: Icon(
                        LucideIcons.shoppingCart,
                        color: theme.colorScheme.onPrimary,
                        size: 18,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }

  Widget singleCartItem(
      {required String image,
      required String name,
      double? price,
      required int index}) {
    final GlobalKey simpleMenuKey = GlobalKey();
    List<int> list = List<int>.generate(5, (i) => i + 1);

    return Container(
      margin: EdgeInsets.only(top: 12, bottom: 12),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            child: Image.asset(
              image,
              height: MediaQuery.of(context).size.width * 0.23,
              fit: BoxFit.fill,
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 16),
              height: MediaQuery.of(context).size.width * 0.23,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MyText.titleMedium(name,
                      color: theme.colorScheme.onBackground, letterSpacing: 0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      PopupMenuButton(
                          key: simpleMenuKey,
                          onSelected: (dynamic item) {
                            setState(() {
                              _cartQtyList[index] = item;
                            });
                          },
                          itemBuilder: (BuildContext context) {
                            return list.map((int option) {
                              return PopupMenuItem(
                                value: option,
                                height: 36,
                                child: MyText.bodyMedium(option.toString(),
                                    color: theme.colorScheme.onBackground),
                              );
                            }).toList();
                          },
                          color: theme.colorScheme.background,
                          child: Container(
                            padding: EdgeInsets.only(
                                left: 12, right: 12, top: 8, bottom: 8),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              color: customTheme.card,
                              border: Border.all(
                                  color: customTheme.border, width: 1),
                            ),
                            child: Row(
                              children: <Widget>[
                                MyText.bodyLarge(
                                  _cartQtyList[index].toString(),
                                  color: theme.colorScheme.onBackground,
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 4),
                                  child: Icon(
                                    LucideIcons.chevronDown,
                                    size: 22,
                                    color: theme.colorScheme.onBackground,
                                  ),
                                )
                              ],
                            ),
                          )),
                      MyText.bodyLarge("\$$price",
                          color: theme.colorScheme.onBackground,
                          letterSpacing: 0)
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _CardBillWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.only(top: 16),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              MyText.titleMedium(
                'Subtotal',
                color: theme.colorScheme.onBackground,
              ),
              MyText.titleMedium(
                "\$ 399.99",
                color: theme.colorScheme.onBackground,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                MyText.titleMedium(
                  "Charges",
                  color: theme.colorScheme.onBackground,
                ),
                MyText.titleMedium(
                  "+ \$ 59.59",
                  color: theme.colorScheme.onBackground,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                MyText.titleMedium(
                  "Discount",
                  color: theme.colorScheme.onBackground,
                ),
                MyText.titleMedium(
                  "- \$ 9.99",
                  color: theme.colorScheme.onBackground,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
