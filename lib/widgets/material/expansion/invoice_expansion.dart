/*
* File : Invoice Expansion
* Version : 1.0.0
* */

import 'package:yoven/helpers/theme/app_theme.dart';
import 'package:yoven/helpers/widgets/my_spacing.dart';
import 'package:yoven/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';

class InvoiceExpansion extends StatefulWidget {
  @override
  _InvoiceExpansionState createState() => _InvoiceExpansionState();
}

class _InvoiceExpansionState extends State<InvoiceExpansion> {
  final List<bool> _dataExpansionPanel = [true, false, true];

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
      children: <Widget>[
        Container(
          padding: MySpacing.xy(24, 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MyText.titleSmall("Invoice", fontWeight: 600),
                  MyText.bodyLarge("# 100457", fontWeight: 500),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  MyText.titleSmall("Date", fontWeight: 600),
                  MyText.bodyLarge("8, Jun", fontWeight: 500),
                ],
              ),
            ],
          ),
        ),
        Container(
          color: theme.colorScheme.background,
          padding: MySpacing.all(16),
          child: Column(
            children: <Widget>[
              ExpansionPanelList(
                expandedHeaderPadding: EdgeInsets.all(0),
                expansionCallback: (int index, bool isExpanded) {
                  setState(() {
                    _dataExpansionPanel[index] = !isExpanded;
                  });
                },
                animationDuration: Duration(milliseconds: 500),
                children: <ExpansionPanel>[
                  ExpansionPanel(
                      canTapOnHeader: true,
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return Container(
                            padding: MySpacing.all(16),
                            child: MyText.titleMedium("Personal Information",
                                fontWeight: isExpanded ? 700 : 600,
                                letterSpacing: 0));
                      },
                      body: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: MySpacing.fromLTRB(24, 0, 24, 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              MyText.titleSmall("Mr. Rodrigo Pierce",
                                  height: 1.4, fontWeight: 500),
                              MyText.titleSmall("rog_pie@gmail.com",
                                  height: 1.4,
                                  fontWeight: 500,
                                  letterSpacing: 0.3),
                              MyText.titleSmall("Contact : (047) 98760235 ",
                                  fontWeight: 500, height: 1.4),
                            ],
                          )),
                      isExpanded: _dataExpansionPanel[0]),
                  ExpansionPanel(
                      canTapOnHeader: true,
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return Container(
                            padding: MySpacing.all(16),
                            child: MyText.titleMedium("Address",
                                fontWeight: isExpanded ? 700 : 600,
                                letterSpacing: 0));
                      },
                      body: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: MySpacing.fromLTRB(24, 0, 24, 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              MyText.titleSmall("4675  Hartland Avenue",
                                  fontWeight: 500, height: 1.4),
                              MyText.titleSmall("Ashwa - 54304",
                                  fontWeight: 500, height: 1.4),
                              MyText.titleSmall("United Kingdom ",
                                  fontWeight: 500, height: 1.4),
                            ],
                          )),
                      isExpanded: _dataExpansionPanel[1]),
                  ExpansionPanel(
                      canTapOnHeader: true,
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return Container(
                            padding: MySpacing.all(16),
                            child: MyText.titleMedium("Bill",
                                fontWeight: isExpanded ? 700 : 600,
                                letterSpacing: 0));
                      },
                      body: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: MySpacing.fromLTRB(24, 0, 24, 16),
                          child: Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  MyText.titleMedium("Subtotal",
                                      fontWeight: 600, height: 1.4),
                                  MyText.titleMedium("\$  299.99",
                                      fontWeight: 600, height: 1.4),
                                ],
                              ),
                              Padding(
                                padding: MySpacing.top(8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    MyText.titleMedium("Shipping cost",
                                        fontWeight: 600, height: 1.4),
                                    MyText.titleMedium("\$  49",
                                        fontWeight: 600, height: 1.4),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: MySpacing.top(8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    MyText.titleMedium("Taxes",
                                        fontWeight: 600, height: 1.4),
                                    MyText.titleMedium("\$  29",
                                        fontWeight: 600, height: 1.4),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: MySpacing.top(8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    MyText.titleMedium("Total",
                                        height: 1.4, fontWeight: 800),
                                    MyText.titleMedium("\$  399",
                                        height: 1.4, fontWeight: 800),
                                  ],
                                ),
                              ),
                            ],
                          )),
                      isExpanded: _dataExpansionPanel[2])
                ],
              )
            ],
          ),
        )
      ],
    ));
  }
}
