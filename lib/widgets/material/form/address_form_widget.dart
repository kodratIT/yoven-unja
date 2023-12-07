/*
* File : Address Form
* Version : 1.0.0
* */

import 'package:jambicraff/helpers/theme/app_theme.dart';
import 'package:jambicraff/helpers/widgets/my_spacing.dart';
import 'package:jambicraff/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AddressFormWidget extends StatefulWidget {
  @override
  _AddressFormWidgetState createState() => _AddressFormWidgetState();
}

class _AddressFormWidgetState extends State<AddressFormWidget> {
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
      tag: 'address_form_widget',
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
              title: MyText.titleMedium("Address Form", fontWeight: 600),
            ),
            body: ListView(
              padding: MySpacing.nTop(20),
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Address 1",
                    border: theme.inputDecorationTheme.border,
                    enabledBorder: theme.inputDecorationTheme.border,
                    focusedBorder: theme.inputDecorationTheme.focusedBorder,
                    prefixIcon: Icon(LucideIcons.mapPin, size: 24),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 8),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Address 2",
                      border: theme.inputDecorationTheme.border,
                      enabledBorder: theme.inputDecorationTheme.border,
                      focusedBorder: theme.inputDecorationTheme.focusedBorder,
                      prefixIcon: Icon(
                        LucideIcons.mapPin,
                        size: 24,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(top: 8),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: "House",
                            border: theme.inputDecorationTheme.border,
                            enabledBorder: theme.inputDecorationTheme.border,
                            focusedBorder:
                                theme.inputDecorationTheme.focusedBorder,
                            prefixIcon: Icon(
                              LucideIcons.home,
                              size: 24,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: "PIN Code",
                              border: theme.inputDecorationTheme.border,
                              enabledBorder: theme.inputDecorationTheme.border,
                              focusedBorder:
                                  theme.inputDecorationTheme.focusedBorder,
                              prefixIcon: Icon(
                                MdiIcons.numeric,
                                size: 24,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 8),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "City",
                      border: theme.inputDecorationTheme.border,
                      enabledBorder: theme.inputDecorationTheme.border,
                      focusedBorder: theme.inputDecorationTheme.focusedBorder,
                      prefixIcon: Icon(
                        LucideIcons.building,
                        size: 24,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 8),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Contact",
                      border: theme.inputDecorationTheme.border,
                      enabledBorder: theme.inputDecorationTheme.border,
                      focusedBorder: theme.inputDecorationTheme.focusedBorder,
                      prefixIcon: Icon(
                        LucideIcons.phone,
                        size: 24,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 8),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Delivery note",
                      border: theme.inputDecorationTheme.border,
                      enabledBorder: theme.inputDecorationTheme.border,
                      focusedBorder: theme.inputDecorationTheme.focusedBorder,
                      prefixIcon: Icon(
                        LucideIcons.info,
                        size: 24,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 16),
                  alignment: Alignment.center,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      boxShadow: [
                        BoxShadow(
                          color: theme.colorScheme.primary.withAlpha(28),
                          blurRadius: 4,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            padding:
                                MaterialStateProperty.all(MySpacing.xy(16, 0))),
                        child: MyText.bodyMedium("SAVE",
                            fontWeight: 700,
                            letterSpacing: 0.2,
                            color: theme.colorScheme.onPrimary)),
                  ),
                )
              ],
            ));
      },
    );
  }
}
