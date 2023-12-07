/*
* File : Address Form
* Version : 1.0.0
* */

import 'package:yoven/helpers/theme/app_theme.dart';
import 'package:yoven/helpers/widgets/my_button.dart';
import 'package:yoven/helpers/widgets/my_spacing.dart';
import 'package:yoven/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';

class AddressForm extends StatefulWidget {
  @override
  _AddressFormState createState() => _AddressFormState();
}

class _AddressFormState extends State<AddressForm> {
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
      padding: MySpacing.all(16),
      children: <Widget>[
        TextFormField(
          decoration: InputDecoration(
            labelText: "Address 1",
            border: theme.inputDecorationTheme.border,
            enabledBorder: theme.inputDecorationTheme.border,
            focusedBorder: theme.inputDecorationTheme.focusedBorder,
            prefixIcon: Icon(Icons.location_on_outlined, size: 24),
          ),
        ),
        Container(
          margin: MySpacing.top(8),
          child: TextFormField(
            decoration: InputDecoration(
              labelText: "Address 2",
              border: theme.inputDecorationTheme.border,
              enabledBorder: theme.inputDecorationTheme.border,
              focusedBorder: theme.inputDecorationTheme.focusedBorder,
              prefixIcon: Icon(
                Icons.add_location_outlined,
                size: 24,
              ),
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          margin: MySpacing.top(8),
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
                    focusedBorder: theme.inputDecorationTheme.focusedBorder,
                    prefixIcon: Icon(
                      Icons.home_outlined,
                      size: 24,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: MySpacing.left(8),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "PIN Code",
                      border: theme.inputDecorationTheme.border,
                      enabledBorder: theme.inputDecorationTheme.border,
                      focusedBorder: theme.inputDecorationTheme.focusedBorder,
                      prefixIcon: Icon(
                        Icons.format_list_numbered_rtl_outlined,
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
          margin: MySpacing.top(8),
          child: TextFormField(
            decoration: InputDecoration(
              labelText: "City",
              border: theme.inputDecorationTheme.border,
              enabledBorder: theme.inputDecorationTheme.border,
              focusedBorder: theme.inputDecorationTheme.focusedBorder,
              prefixIcon: Icon(
                Icons.location_city_outlined,
                size: 24,
              ),
            ),
          ),
        ),
        Container(
          margin: MySpacing.top(8),
          child: TextFormField(
            decoration: InputDecoration(
              labelText: "Contact",
              border: theme.inputDecorationTheme.border,
              enabledBorder: theme.inputDecorationTheme.border,
              focusedBorder: theme.inputDecorationTheme.focusedBorder,
              prefixIcon: Icon(
                Icons.phone_outlined,
                size: 24,
              ),
            ),
          ),
        ),
        Container(
          margin: MySpacing.top(8),
          child: TextFormField(
            decoration: InputDecoration(
              labelText: "Delivery note",
              border: theme.inputDecorationTheme.border,
              enabledBorder: theme.inputDecorationTheme.border,
              focusedBorder: theme.inputDecorationTheme.focusedBorder,
              prefixIcon: Icon(
                Icons.info_outline,
                size: 24,
              ),
            ),
          ),
        ),
        Container(
          margin: MySpacing.top(16),
          alignment: Alignment.center,
          child: MyButton(
              elevation: 0,
              borderRadiusAll: 4,
              onPressed: () {},
              padding: MySpacing.xy(18, 16),
              child: MyText.bodyMedium("SAVE",
                  fontWeight: 600,
                  letterSpacing: 0.2,
                  color: theme.colorScheme.onPrimary)),
        )
      ],
    ));
  }
}
