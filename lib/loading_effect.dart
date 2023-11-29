import 'package:yoven/helpers/theme/app_theme.dart';
import 'package:yoven/helpers/theme/theme_type.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shimmer/shimmer.dart';

import 'package:yoven/helpers/widgets/my_spacing.dart';

//----------------------- Loading Screens  (Shimmer Effects) ---------------------------//

class LoadingThemeData {
  late Color shimmerBaseColor, shimmerHighlightColor;
  LoadingThemeData(
      {this.shimmerBaseColor = const Color(0xFFF5F5F5),
      this.shimmerHighlightColor = const Color(0xFFE0E0E0)});

  static get theme => AppTheme.themeType == ThemeType.light
      ? LoadingThemeData.light
      : LoadingThemeData.dark;

  static get light => LoadingThemeData(
      shimmerBaseColor: Color(0xFFF5F5F5),
      shimmerHighlightColor: Color(0xFFE0E0E0));
  static get dark => LoadingThemeData(
      shimmerBaseColor: Color(0xFF1a1a1a),
      shimmerHighlightColor: Color(0xFF454545));
}

class LoadingEffect {
  static Widget getSearchLoadingScreen(BuildContext context,
      {int itemCount = 4}) {
    LoadingThemeData theme = LoadingThemeData.theme;
    Widget singleLoading = Shimmer.fromColors(
        baseColor: theme.shimmerBaseColor,
        highlightColor: theme.shimmerHighlightColor,
        child: Container(
          height: 96,
          padding: MySpacing.all(16),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                height: 56,
                width: 56,
                color: Colors.grey,
              ),
              Expanded(
                child: Container(
                  height: 56,
                  padding: MySpacing.only(left: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Flexible(
                            flex: 2,
                            child: Container(
                              alignment: Alignment.topLeft,
                              height: 8,
                              color: Colors.grey,
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Icon(
                                LucideIcons.heart,
                                color: theme.shimmerBaseColor,
                                size: 24,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Flexible(
                            flex: 2,
                            child: Container(
                              height: 8,
                              color: Colors.grey,
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: Align(
                              alignment: Alignment.centerRight,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Flexible(
                            flex: 2,
                            child: Container(
                              height: 8,
                              color: Colors.grey,
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                  height: 8, width: 36, color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));

    List<Widget> list = [];
    for (int i = 0; i < itemCount; i++) {
      list.add(Container(
          padding: MySpacing.fromLTRB(16, 8, 16, 8), child: singleLoading));
    }
    return Column(
      children: list,
    );
  }

  static Widget getFavouriteLoadingScreen(BuildContext context,
      {int itemCount = 4}) {
    LoadingThemeData theme = LoadingThemeData.theme;

    Widget singleLoading = Shimmer.fromColors(
        baseColor: theme.shimmerBaseColor,
        highlightColor: theme.shimmerHighlightColor,
        child: Container(
          height: 96,
          padding: MySpacing.all(16),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                height: 56,
                width: 56,
                color: Colors.grey,
              ),
              Expanded(
                child: Container(
                  height: 56,
                  padding: MySpacing.only(left: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Flexible(
                            flex: 2,
                            child: Container(
                              alignment: Alignment.topLeft,
                              height: 8,
                              color: Colors.grey,
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Icon(
                                LucideIcons.heart,
                                color: theme.shimmerBaseColor,
                                size: 24,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Flexible(
                            flex: 2,
                            child: Container(
                              height: 8,
                              color: Colors.grey,
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: Align(
                              alignment: Alignment.centerRight,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Flexible(
                            flex: 2,
                            child: Container(
                              height: 8,
                              color: Colors.grey,
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                  height: 8, width: 36, color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));

    List<Widget> list = [];
    for (int i = 0; i < itemCount; i++) {
      list.add(Container(
          padding: MySpacing.fromLTRB(16, 8, 16, 8), child: singleLoading));
    }
    return Column(
      children: list,
    );
  }

  static Widget getProductLoadingScreen(BuildContext context) {
    LoadingThemeData theme = LoadingThemeData.theme;

    return Shimmer.fromColors(
      baseColor: theme.shimmerBaseColor,
      highlightColor: theme.shimmerHighlightColor,
      child: Container(
        padding: MySpacing.all(24),
        child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.width * 0.5,
              width: MediaQuery.of(context).size.width * 0.5,
              color: Colors.grey,
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              height: 90,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: Colors.grey),
              ),
            ),
            SizedBox(height: 16),
            Container(
              height: 120,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: Colors.grey),
              ),
            ),
            SizedBox(height: 16),
            Container(
              height: 220,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget getDatingHomeScreen(
    BuildContext context,
  ) {
    LoadingThemeData theme = LoadingThemeData.theme;
    return Shimmer.fromColors(
      baseColor: theme.shimmerBaseColor,
      highlightColor: theme.shimmerHighlightColor,
      child: Container(
        padding: MySpacing.all(24),
        child: Column(
          children: <Widget>[
            Container(
              height: 60,
              width: MediaQuery.of(context).size.width,
              color: Colors.grey,
            ),
            SizedBox(
              height: 16,
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: Colors.grey),
                ),
              ),
            ),
            SizedBox(height: 16),
            Container(
              height: 80,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget getCartLoadingScreen(BuildContext context,
      {int itemCount = 2}) {
    LoadingThemeData theme = LoadingThemeData.theme;

    Widget singleLoading = Shimmer.fromColors(
        baseColor: theme.shimmerBaseColor,
        highlightColor: theme.shimmerHighlightColor,
        child: Container(
          padding: MySpacing.symmetric(horizontal: 16, vertical: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: MySpacing.only(bottom: 12),
                child: Container(
                  height: 8,
                  width: 120,
                  color: Colors.grey,
                ),
              ),
              Container(
                padding: MySpacing.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Container(
                      height: 64,
                      width: 64,
                      color: Colors.grey,
                    ),
                    Expanded(
                      child: Container(
                        padding: MySpacing.horizontal(8.0),
                        height: 64,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                    height: 8, width: 160, color: Colors.grey),
                                SizedBox(height: 8),
                                Container(
                                    height: 8, width: 80, color: Colors.grey),
                              ],
                            ),
                            Align(
                                alignment: Alignment.bottomRight,
                                child: Container(
                                    height: 8, width: 80, color: Colors.grey)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));

    List<Widget> list = [];
    for (int i = 0; i < itemCount; i++) {
      list.add(Container(padding: MySpacing.all(16), child: singleLoading));
    }
    return Column(
      children: list,
    );
  }

  static Widget getOrderLoadingScreen(BuildContext context,
      {int itemCount = 3}) {
    LoadingThemeData theme = LoadingThemeData.theme;

    Widget singleLoading = Shimmer.fromColors(
      baseColor: theme.shimmerBaseColor,
      highlightColor: theme.shimmerHighlightColor,
      child: Container(
        padding: MySpacing.all(16),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey),
        ),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Flexible(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 12,
                        color: Colors.grey,
                      ),
                      Padding(
                        padding: MySpacing.only(top: 8.0),
                        child: Container(
                          height: 8,
                          color: Colors.grey,
                        ),
                      ),
                      Padding(
                        padding: MySpacing.only(top: 16.0),
                        child: Container(
                          height: 8,
                          color: Colors.grey,
                        ),
                      ),
                      Padding(
                          padding: MySpacing.only(top: 8),
                          child: Container(
                            height: 80,
                            width: 80,
                            color: Colors.grey,
                          )),
                    ],
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(),
                ),
                Flexible(
                  flex: 3,
                  child: Container(
                    height: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );

    List<Widget> list = [];
    for (int i = 0; i < itemCount; i++) {
      list.add(Container(padding: MySpacing.all(16), child: singleLoading));
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: list,
    );
  }

  static Widget getCouponLoadingScreen(BuildContext context,
      {int itemCount = 3}) {
    LoadingThemeData theme = LoadingThemeData.theme;

    Widget singleLoading = Shimmer.fromColors(
      baseColor: theme.shimmerBaseColor,
      highlightColor: theme.shimmerHighlightColor,
      child: Container(
        padding: MySpacing.all(16),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey),
        ),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  height: 40,
                  width: 40,
                  color: Colors.grey,
                ),
                Container(
                  height: 40,
                  padding: MySpacing.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        height: 8,
                        width: 64,
                        color: Colors.grey,
                      ),
                      Container(
                        height: 8,
                        width: 136,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              padding: MySpacing.only(top: 16),
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        height: 8,
                        width: 80,
                        color: Colors.grey,
                      ),
                      Container(
                        height: 8,
                        width: 80,
                        color: Colors.grey,
                      )
                    ],
                  ),
                  Container(
                    height: 24,
                    width: 80,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

    List<Widget> list = [];
    for (int i = 0; i < itemCount; i++) {
      list.add(Container(padding: MySpacing.all(16), child: singleLoading));
    }
    return Column(
      children: list,
    );
  }

  static Widget getAddressLoadingScreen(BuildContext context,
      {int itemCount = 3}) {
    LoadingThemeData theme = LoadingThemeData.theme;

    Widget singleLoading = Shimmer.fromColors(
      baseColor: theme.shimmerBaseColor,
      highlightColor: theme.shimmerHighlightColor,
      child: Container(
        padding: MySpacing.all(16),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey),
        ),
        child: Row(
          children: <Widget>[
            Icon(
              LucideIcons.mapPin,
              color: theme.shimmerBaseColor,
              size: 32,
            ),
            Container(
              padding: MySpacing.only(left: 8),
              height: 32,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 8,
                    width: 140,
                    color: Colors.grey,
                  ),
                  Container(
                    height: 8,
                    width: 140,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

    List<Widget> list = [];
    for (int i = 0; i < itemCount; i++) {
      list.add(Container(padding: MySpacing.all(16), child: singleLoading));
    }
    return Column(
      children: list,
    );
  }

  static Widget getReviewLoadingScreen(BuildContext context) {
    LoadingThemeData theme = LoadingThemeData.theme;

    return Shimmer.fromColors(
      baseColor: theme.shimmerBaseColor,
      highlightColor: theme.shimmerHighlightColor,
      child: Container(
        padding: MySpacing.all(16),
        child: Column(
          children: <Widget>[
            Container(
              padding: MySpacing.all(16),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey),
              ),
              child: Row(
                children: <Widget>[
                  Container(
                    height: 56,
                    width: 56,
                    color: Colors.grey,
                  ),
                  Container(
                    padding: MySpacing.only(left: 16),
                    height: 56,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: 8,
                          width: 140,
                          color: Colors.grey,
                        ),
                        Container(
                          height: 8,
                          width: 80,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: MySpacing.only(top: 32.0, bottom: 16),
              child: Container(
                height: 16,
                width: 120,
                color: Colors.grey,
              ),
            ),
            Container(
              height: 120,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }

  static Widget getConfirmPaymentLoadingScreen(
    BuildContext context,
  ) {
    LoadingThemeData theme = LoadingThemeData.theme;

    return Shimmer.fromColors(
      baseColor: theme.shimmerBaseColor,
      highlightColor: theme.shimmerHighlightColor,
      child: Container(
        padding: MySpacing.all(16),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey),
        ),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Flexible(
                  flex: 2,
                  child: Container(
                    height: 8,
                    color: Colors.grey,
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Container(
                    height: 8,
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    height: 8,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              children: <Widget>[
                Flexible(
                  flex: 2,
                  child: Container(
                    height: 8,
                    color: Colors.grey,
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Container(
                    height: 8,
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    height: 8,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              children: <Widget>[
                Flexible(
                  flex: 2,
                  child: Container(
                    height: 8,
                    color: Colors.grey,
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Container(
                    height: 8,
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    height: 8,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              children: <Widget>[
                Flexible(
                  flex: 2,
                  child: Container(
                    height: 8,
                    color: Colors.grey,
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Container(
                    height: 8,
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    height: 8,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              children: <Widget>[
                Flexible(
                  flex: 2,
                  child: Container(
                    height: 8,
                    color: Colors.grey,
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Container(
                    height: 8,
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    height: 8,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  static Widget getSimpleImageScreen(BuildContext context,
      {double? width = 60, double? height = 60}) {
    LoadingThemeData theme = LoadingThemeData.theme;

    Widget singleLoading = Shimmer.fromColors(
        baseColor: theme.shimmerBaseColor,
        highlightColor: theme.shimmerHighlightColor,
        child: Container(
          height: height,
          width: width,
          color: Colors.grey,
        ));
    return singleLoading;
  }
}
