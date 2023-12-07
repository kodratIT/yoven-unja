/*
* File : Choice chip
* Version : 1.0.0
* */

import 'package:jambicraff/helpers/theme/app_theme.dart';
import 'package:jambicraff/helpers/widgets/my_button.dart';
import 'package:jambicraff/helpers/widgets/my_spacing.dart';
import 'package:jambicraff/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class ChoiceChipWidget extends StatefulWidget {
  @override
  _ChoiceChipWidgetState createState() => _ChoiceChipWidgetState();
}

class _ChoiceChipWidgetState extends State<ChoiceChipWidget> {
  final List<String> _reportList = [
    "Not relevant",
    "Illegal",
    "Spam",
    "Offensive",
    "Uncivil",
    "Other",
  ];

  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
    WidgetsBinding.instance.addPostFrameCallback((_) => _showDialog());
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
        appBar: AppBar(
          elevation: 0,
          leading: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: Icon(
              LucideIcons.chevronLeft,
              size: 20,
            ),
          ),
          title: MyText.titleMedium("Choice chip", fontWeight: 600),
        ),
        body: Center(
          child: MyButton(
              elevation: 0,
              borderRadiusAll: 4,
              onPressed: () {
                _showDialog();
              },
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

  late ThemeData theme;

  _buildChoiceList() {
    List<Widget> choices = [];
    for (var item in widget.reportList) {
      choices.add(Container(
        padding: EdgeInsets.all(4.0),
        child: ChoiceChip(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          selectedColor: theme.colorScheme.primary,
          label: MyText.bodyMedium(item,
              color: selectedChoices.contains(item)
                  ? theme.colorScheme.onPrimary
                  : theme.colorScheme.onBackground),
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
    theme = Theme.of(context);
    return AlertDialog(
      title: MyText.bodyLarge("Report Video", fontWeight: 600),
      content: Wrap(
        children: _buildChoiceList(),
      ),
      actions: <Widget>[
        MyButton(
          borderRadiusAll: 4,
          elevation: 0,
          child: MyText.bodyLarge("REPORT",
              fontWeight: 600, color: theme.colorScheme.onPrimary),
          onPressed: () => Navigator.of(context).pop(),
        ),
        MySpacing.width(8)
      ],
    );
  }
}
