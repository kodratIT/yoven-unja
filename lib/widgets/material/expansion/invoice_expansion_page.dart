/*
* File : Invoice Expansion
* Version : 1.0.0
* */
import 'package:yoven/helpers/theme/app_theme.dart';
import 'package:yoven/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:lucide_icons/lucide_icons.dart';

class InvoiceExpansionPage extends StatefulWidget {
  @override
  _InvoiceExpansionPageState createState() => _InvoiceExpansionPageState();
}

class _InvoiceExpansionPageState extends State<InvoiceExpansionPage> {
  final List<bool> _dataExpansionPanel = [true, false, true];

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
    return GetBuilder(
      tag: 'invoice_expansion_page',
      builder: (controller) {
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
              title: MyText.titleMedium("Invoice", fontWeight: 600),
            ),
            body: Container(
              color: theme.colorScheme.background,
              child: ListView(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(
                        top: 16, left: 24, right: 24, bottom: 16),
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
                    padding: EdgeInsets.all(16),
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
                                headerBuilder:
                                    (BuildContext context, bool isExpanded) {
                                  return Container(
                                      padding: EdgeInsets.all(16),
                                      child: MyText.titleMedium(
                                          "Personal Information",
                                          fontWeight: isExpanded ? 700 : 600,
                                          letterSpacing: 0));
                                },
                                body: Container(
                                    width: MediaQuery.of(context).size.width,
                                    padding: EdgeInsets.only(
                                        bottom: 16,
                                        top: 0,
                                        left: 24,
                                        right: 24),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        MyText.titleSmall("Mr. Rodrigo Pierce",
                                            height: 1.4, fontWeight: 500),
                                        MyText.titleSmall("rog_pie@gmail.com",
                                            height: 1.4,
                                            fontWeight: 500,
                                            letterSpacing: 0.3),
                                        MyText.titleSmall(
                                            "Contact : (047) 98760235 ",
                                            fontWeight: 500,
                                            height: 1.4),
                                      ],
                                    )),
                                isExpanded: _dataExpansionPanel[0]),
                            ExpansionPanel(
                                canTapOnHeader: true,
                                headerBuilder:
                                    (BuildContext context, bool isExpanded) {
                                  return Container(
                                      padding: EdgeInsets.all(16),
                                      child: MyText.titleMedium("Address",
                                          fontWeight: isExpanded ? 700 : 600,
                                          letterSpacing: 0));
                                },
                                body: Container(
                                    width: MediaQuery.of(context).size.width,
                                    padding: EdgeInsets.only(
                                        bottom: 16,
                                        top: 0,
                                        left: 24,
                                        right: 24),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        MyText.titleSmall(
                                            "4675  Hartland Avenue",
                                            fontWeight: 500,
                                            height: 1.4),
                                        MyText.titleSmall("Ashwa - 54304",
                                            fontWeight: 500, height: 1.4),
                                        MyText.titleSmall("United Kingdom ",
                                            fontWeight: 500, height: 1.4),
                                      ],
                                    )),
                                isExpanded: _dataExpansionPanel[1]),
                            ExpansionPanel(
                                canTapOnHeader: true,
                                headerBuilder:
                                    (BuildContext context, bool isExpanded) {
                                  return Container(
                                      padding: EdgeInsets.all(16),
                                      child: MyText.titleMedium("Bill",
                                          fontWeight: isExpanded ? 700 : 600,
                                          letterSpacing: 0));
                                },
                                body: Container(
                                    width: MediaQuery.of(context).size.width,
                                    padding: EdgeInsets.only(
                                        bottom: 16,
                                        top: 0,
                                        left: 24,
                                        right: 24),
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
                                          padding:
                                              const EdgeInsets.only(top: 8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              MyText.titleMedium(
                                                  "Shipping cost",
                                                  fontWeight: 600,
                                                  height: 1.4),
                                              MyText.titleMedium("\$  49",
                                                  fontWeight: 600, height: 1.4),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 8.0),
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
                                          padding:
                                              const EdgeInsets.only(top: 8.0),
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
              ),
            ));
      },
    );
  }
}
