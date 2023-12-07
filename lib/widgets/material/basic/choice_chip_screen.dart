/*
* File : Choice chip
* Version : 1.0.0
* */

import 'package:yoven/helpers/theme/app_theme.dart';
import 'package:yoven/helpers/widgets/my_button.dart';
import 'package:yoven/helpers/widgets/my_spacing.dart';
import 'package:yoven/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';

class ChoiceChipScreen extends StatefulWidget {
  @override
  _ChoiceChipScreenState createState() => _ChoiceChipScreenState();
}

class _ChoiceChipScreenState extends State<ChoiceChipScreen> {
  final List<String> _reportList = [
    "Not relevant",
    "Illegal",
    "Spam",
    "Offensive",
    "Uncivil",
    "Other",
  ];

  late ThemeData theme;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) => ChoiceDialog(
              reportList: _reportList,
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: MyButton(
          elevation: 0,
          borderRadiusAll: 4,
          onPressed: () {
            _showDialog();
          },
          padding: MySpacing.xy(18, 12),
          child: MyText.labelMedium("Report".toUpperCase(),
              fontWeight: 700, color: theme.colorScheme.onPrimary)),
    ));
  }
}

class ChoiceDialog extends StatefulWidget {
  final List<String> reportList;

  const ChoiceDialog({Key? key, required this.reportList}) : super(key: key);

  @override
  _ChoiceDialogState createState() => _ChoiceDialogState();
}

class _ChoiceDialogState extends State<ChoiceDialog> {
  List<String> selectedChoices = [];

  late ThemeData themeData;

  _buildChoiceList() {
    List<Widget> choices = [];
    for (var item in widget.reportList) {
      choices.add(Container(
        padding: EdgeInsets.all(4.0),
        child: ChoiceChip(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          selectedColor: themeData.colorScheme.primary,
          label: MyText.bodyMedium(item,
              color: selectedChoices.contains(item)
                  ? themeData.colorScheme.onPrimary
                  : themeData.colorScheme.onBackground),
          selected: selectedChoices.contains(item),
          onSelected: (selected) {
            setState(() {
              selectedChoices.contains(item)
                  ? selectedChoices.remove(item)
                  : selectedChoices.add(item);
            });
          },
        ),
      ));
    }
    return choices;
  }

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return AlertDialog(
      title: MyText.bodyLarge("Report Video", fontWeight: 600),
      content: Wrap(
        children: _buildChoiceList(),
      ),
      actions: <Widget>[
        MyButton.text(
          borderRadiusAll: 4,
          child: MyText.titleSmall("REPORT",
              fontWeight: 600, color: themeData.colorScheme.primary),
          onPressed: () => Navigator.of(context).pop(),
        )
      ],
    );
  }
}
