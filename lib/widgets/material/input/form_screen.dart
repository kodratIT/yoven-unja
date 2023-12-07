/*
* File : Forms
* Version : 1.0.0
* */

import 'package:yoven/helpers/theme/app_theme.dart';
import 'package:yoven/helpers/widgets/my_button.dart';
import 'package:yoven/helpers/widgets/my_spacing.dart';
import 'package:yoven/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class FormScreen extends StatefulWidget {
  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  bool _passwordVisible = false;
  late ThemeData theme;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.now();
    selectedTime = TimeOfDay.now();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  late TimeOfDay selectedTime;
  DateTime? selectedDate;

  double _sliderValue1 = 30;
  double _sliderValue2 = 60;
  RangeValues rangeValues = RangeValues(20, 80);

  bool? _switch = true, _check1 = true, _check2 = false, _check3 = true;
  int? _radioValue = 1;

  _pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate!,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        showSnackBarWithFloating(
            "${picked.day} - ${picked.month} - ${picked.year}");
      });
    }
  }

  _pickTime(BuildContext context) async {
    TimeOfDay? t =
        await showTimePicker(context: context, initialTime: selectedTime);
    if (t != null) {
      setState(() {
        selectedTime = t;
        showSnackBarWithFloating(t.format(context));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body: Container(
            color: theme.colorScheme.background,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: MySpacing.fromLTRB(16, 16, 16, 8),
                    child: MyText.titleMedium("Text Fields",
                        fontWeight: 600, letterSpacing: 0.2),
                  ),
                  Container(
                    padding: MySpacing.xy(16, 8),
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: "Name",
                            border: theme.inputDecorationTheme.border,
                            enabledBorder: theme.inputDecorationTheme.border,
                            focusedBorder:
                                theme.inputDecorationTheme.focusedBorder,
                            prefixIcon: Icon(Icons.person),
                          ),
                          controller:
                              TextEditingController(text: "Natalia Dyer"),
                        ),
                        Padding(
                          padding: MySpacing.top(16),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: "Email",
                              border: theme.inputDecorationTheme.border,
                              enabledBorder: theme.inputDecorationTheme.border,
                              focusedBorder:
                                  theme.inputDecorationTheme.focusedBorder,
                              prefixIcon: Icon(Icons.email),
                            ),
                            controller:
                                TextEditingController(text: "nat@mail.com"),
                          ),
                        ),
                        Padding(
                          padding: MySpacing.top(16),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: "Phone",
                              border: theme.inputDecorationTheme.border,
                              enabledBorder: theme.inputDecorationTheme.border,
                              focusedBorder:
                                  theme.inputDecorationTheme.focusedBorder,
                              prefixIcon: Icon(Icons.phone),
                            ),
                            controller:
                                TextEditingController(text: "091-987456321"),
                          ),
                        ),
                        Padding(
                          padding: MySpacing.top(16),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: "Password",
                              border: theme.inputDecorationTheme.border,
                              enabledBorder: theme.inputDecorationTheme.border,
                              focusedBorder:
                                  theme.inputDecorationTheme.focusedBorder,
                              prefixIcon: Icon(Icons.lock),
                              suffixIcon: IconButton(
                                icon: Icon(_passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () {
                                  setState(() {
                                    _passwordVisible = !_passwordVisible;
                                  });
                                },
                              ),
                            ),
                            obscureText: _passwordVisible,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: theme.dividerColor,
                    thickness: 1,
                  ),
                  Container(
                    padding: MySpacing.fromLTRB(16, 16, 16, 8),
                    child: MyText.titleMedium("Date & Time Picker",
                        fontWeight: 600, letterSpacing: 0.2),
                  ),
                  Container(
                    padding: MySpacing.xy(8, 16),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            margin: MySpacing.right(8),
                            child: MyButton(
                              borderRadiusAll: 4,
                              elevation: 0,
                              onPressed: () {
                                _pickTime(context);
                              },
                              padding: MySpacing.xy(18, 16),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    LucideIcons.clock,
                                    color: theme.colorScheme.onPrimary,
                                    size: 20,
                                  ),
                                  MySpacing.width(8),
                                  MyText.bodyMedium("Select Time",
                                      fontWeight: 600,
                                      color: theme.colorScheme.onPrimary,
                                      letterSpacing: 0.3),
                                ],
                              ),
                            ),
                          ),
                        ),
                        MySpacing.width(16),
                        Expanded(
                          child: Container(
                            margin: MySpacing.left(8),
                            child: MyButton(
                              padding: MySpacing.xy(18, 16),
                              onPressed: () {
                                _pickDate(context);
                              },
                              elevation: 0,
                              borderRadiusAll: 4,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Icon(
                                    LucideIcons.calendar,
                                    size: 20,
                                    color: theme.colorScheme.onPrimary,
                                  ),
                                  MySpacing.width(8),
                                  MyText.bodyMedium("Select Date",
                                      fontWeight: 600,
                                      color: theme.colorScheme.onPrimary,
                                      letterSpacing: 0.3),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(
                    color: theme.dividerColor,
                    thickness: 1,
                  ),
                  Container(
                    padding: MySpacing.fromLTRB(16, 16, 16, 8),
                    child: MyText.titleMedium("Sliders",
                        fontWeight: 600, letterSpacing: 0.2),
                  ),
                  Slider(
                    value: _sliderValue1,
                    onChanged: (value) {
                      setState(() {
                        _sliderValue1 = value;
                      });
                    },
                    activeColor: theme.colorScheme.primary,
                    inactiveColor: theme.colorScheme.primary.withAlpha(100),
                    min: 0,
                    max: 100,
                  ),
                  Slider(
                    value: _sliderValue2,
                    min: 0,
                    max: 100,
                    divisions: 100,
                    activeColor: theme.colorScheme.primary,
                    inactiveColor: theme.colorScheme.primary.withAlpha(100),
                    label: _sliderValue2.floor().toString(),
                    onChanged: (value) {
                      setState(
                        () {
                          _sliderValue2 = value;
                        },
                      );
                    },
                  ),
                  RangeSlider(
                    values: rangeValues,
                    min: 0.0,
                    max: 100.0,
                    onChanged: (values) {
                      setState(() {
                        rangeValues = values;
                      });
                    },
                    labels: RangeLabels(
                        rangeValues.start.roundToDouble().toString(),
                        rangeValues.end.roundToDouble().toString()),
                    activeColor: theme.colorScheme.primary,
                    inactiveColor: theme.colorScheme.primary.withAlpha(100),
                  ),
                  MySpacing.height(8),
                  Divider(
                    color: theme.dividerColor,
                    thickness: 1,
                  ),
                  Container(
                    padding: MySpacing.nBottom(16),
                    child: MyText.titleMedium("Switch",
                        fontWeight: 600, letterSpacing: 0.2),
                  ),
                  Container(
                      padding: MySpacing.xy(16, 8),
                      child: Switch(
                        onChanged: (bool value) {
                          setState(() {
                            _switch = value;
                          });
                        },
                        value: _switch!,
                        activeColor: theme.colorScheme.primary,
                      )),
                  Divider(
                    color: theme.dividerColor,
                    thickness: 1,
                  ),
                  Container(
                    padding: MySpacing.nBottom(16),
                    child: MyText.titleMedium("Checkboxes",
                        fontWeight: 600, letterSpacing: 0.2),
                  ),
                  Container(
                    padding: MySpacing.xy(16, 8),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Checkbox(
                              activeColor: theme.colorScheme.primary,
                              onChanged: (bool? value) {
                                setState(() {
                                  _check1 = value;
                                });
                              },
                              value: _check1,
                            ),
                            MyText.titleSmall("Check 1",
                                color: theme.colorScheme.onBackground)
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Checkbox(
                              value: _check2,
                              activeColor: theme.colorScheme.primary,
                              onChanged: (bool? value) {
                                setState(() {
                                  _check2 = value;
                                });
                              },
                            ),
                            MyText.titleSmall("Check 2",
                                color: theme.colorScheme.onBackground)
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Checkbox(
                              value: _check3,
                              activeColor: theme.colorScheme.primary,
                              onChanged: (bool? value) {
                                setState(() {
                                  _check3 = value;
                                });
                              },
                            ),
                            MyText.titleSmall("Check 3",
                                color: theme.colorScheme.onBackground)
                          ],
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: theme.dividerColor,
                    thickness: 1,
                  ),
                  Container(
                    padding: MySpacing.nBottom(16),
                    child: MyText.titleMedium("Radio Buttons",
                        fontWeight: 600, letterSpacing: 0.2),
                  ),
                  Container(
                    padding: MySpacing.symmetric(vertical: 8, horizontal: 16),
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          title: MyText.bodyLarge("Radio 1",
                              color: theme.colorScheme.onBackground,
                              letterSpacing: 0.2),
                          contentPadding: MySpacing.all(0),
                          dense: true,
                          leading: Radio(
                            value: 1,
                            activeColor: theme.colorScheme.primary,
                            groupValue: _radioValue,
                            onChanged: (int? value) {
                              setState(() {
                                _radioValue = value;
                              });
                            },
                          ),
                        ),
                        ListTile(
                          title: MyText.bodyLarge("Radio 2",
                              color: theme.colorScheme.onBackground,
                              letterSpacing: 0.2),
                          contentPadding: MySpacing.all(0),
                          dense: true,
                          leading: Radio(
                            value: 2,
                            activeColor: theme.colorScheme.primary,
                            groupValue: _radioValue,
                            onChanged: (int? value) {
                              setState(() {
                                _radioValue = value;
                              });
                            },
                          ),
                        ),
                        ListTile(
                          title: MyText.bodyLarge("Radio 3",
                              color: theme.colorScheme.onBackground,
                              letterSpacing: 0.2),
                          contentPadding: MySpacing.all(0),
                          dense: true,
                          leading: Radio(
                            value: 3,
                            activeColor: theme.colorScheme.primary,
                            groupValue: _radioValue,
                            onChanged: (int? value) {
                              setState(() {
                                _radioValue = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )));
  }

  void showSnackBarWithFloating(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: MyText.titleSmall(message, color: theme.colorScheme.onPrimary),
        backgroundColor: theme.colorScheme.primary,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
