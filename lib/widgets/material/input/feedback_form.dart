/*
* File : Feedback Form
* Version : 1.0.0
* */
import 'package:yoven/helpers/theme/app_theme.dart';
import 'package:yoven/helpers/widgets/my_button.dart';
import 'package:yoven/helpers/widgets/my_container.dart';
import 'package:yoven/helpers/widgets/my_spacing.dart';
import 'package:yoven/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';

class FeedbackForm extends StatefulWidget {
  @override
  _FeedbackFormState createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackForm> {
  int? _radioValue = 1;
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
        body: MyContainer(
            margin: MySpacing.all(20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      MyText.bodyLarge("Send us your feedback!",
                          fontWeight: 700),
                      Container(
                          margin: MySpacing.top(4),
                          child: MyText.bodyMedium(
                              "Do you have a suggestion or found a bug?",
                              fontWeight: 500)),
                      MyText.bodyMedium("Let us know by fill this form",
                          fontWeight: 500),
                    ],
                  ),
                  MySpacing.height(20),
                  MyText.titleMedium("How was your experience?",
                      fontWeight: 700),
                  MySpacing.height(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Icon(Icons.emoji_emotions_outlined,
                          color: theme.colorScheme.primary, size: 32),
                      Icon(Icons.sentiment_neutral,
                          color: theme.colorScheme.onBackground.withAlpha(160),
                          size: 32),
                      Icon(Icons.sentiment_dissatisfied_outlined,
                          color: theme.colorScheme.onBackground.withAlpha(160),
                          size: 32),
                    ],
                  ),
                  MySpacing.height(20),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Describe your experience",
                      isDense: true,
                      filled: true,
                      fillColor: theme.colorScheme.background,
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                    textCapitalization: TextCapitalization.sentences,
                    minLines: 5,
                    maxLines: 10,
                  ),
                  MySpacing.height(20),
                  Row(
                    children: <Widget>[
                      Radio(
                        value: 1,
                        visualDensity: VisualDensity.compact,
                        activeColor: theme.colorScheme.primary,
                        groupValue: _radioValue,
                        onChanged: (int? value) {
                          setState(() {
                            _radioValue = value;
                          });
                        },
                      ),
                      MyText.bodyMedium("Bug", fontWeight: 600),
                      Container(
                        margin: MySpacing.left(8),
                        child: Radio(
                          value: 2,
                          visualDensity: VisualDensity.compact,
                          activeColor: theme.colorScheme.primary,
                          groupValue: _radioValue,
                          onChanged: (int? value) {
                            setState(() {
                              _radioValue = value;
                            });
                          },
                        ),
                      ),
                      MyText.bodyMedium("Suggestion", fontWeight: 600),
                      Container(
                        margin: MySpacing.left(8),
                        child: Radio(
                          value: 3,
                          visualDensity: VisualDensity.compact,
                          activeColor: theme.colorScheme.primary,
                          groupValue: _radioValue,
                          onChanged: (int? value) {
                            setState(() {
                              _radioValue = value;
                            });
                          },
                        ),
                      ),
                      MyText.bodyMedium("Others", fontWeight: 600),
                    ],
                  ),
                  MySpacing.height(20),
                  MyButton.block(
                    onPressed: () {},
                    elevation: 0,
                    borderRadiusAll: 4,
                    splashColor: theme.colorScheme.onPrimary.withAlpha(40),
                    child: MyText.bodyLarge("Send Feedback",
                        color: theme.colorScheme.onPrimary),
                  ),
                ],
              ),
            )));
  }
}
