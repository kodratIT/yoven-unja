/*
* File : Forms
* Version : 1.0.0
* */

import 'package:yoven/helpers/theme/app_theme.dart';
import 'package:yoven/helpers/widgets/my_spacing.dart';
import 'package:yoven/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:lucide_icons/lucide_icons.dart';

class FormWidget extends StatefulWidget {
  @override
  _FormWidgetState createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  bool _passwordVisible = false;

  late TimeOfDay selectedTime;
  DateTime? selectedDate;

  double _sliderValue1 = 30;
  double _sliderValue2 = 60;
  double _starValue = 10;
  double _endValue = 80;

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
        showSnackbarWithFloating(
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
        showSnackbarWithFloating(t.format(context));
      });
    }
  }

  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
    selectedDate = DateTime.now();
    selectedTime = TimeOfDay.now();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      tag: 'form_widget',
      builder: (controller) {
        return Scaffold(
            key: _scaffoldKey,
            appBar: AppBar(
              elevation: 0,
              leading: InkWell(
                onTap: () => Navigator.of(context).pop(),
                child: Icon(
                  LucideIcons.chevronLeft,
                  size: 20,
                ),
              ),
              title: MyText.titleMedium("Form", fontWeight: 600),
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding:
                        EdgeInsets.only(left: 16, right: 16, top: 0, bottom: 8),
                    child: MyText.titleMedium("Text Fields",
                        fontWeight: 600, letterSpacing: 0.2),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
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
                          padding: const EdgeInsets.only(top: 16.0),
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
                          padding: const EdgeInsets.only(top: 16.0),
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
                          padding: const EdgeInsets.only(top: 16.0),
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
                    padding: EdgeInsets.only(
                        left: 16, right: 16, top: 16, bottom: 8),
                    child: MyText.titleMedium("Date & Time Picker",
                        fontWeight: 600, letterSpacing: 0.2),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Container(
                            margin: EdgeInsets.only(right: 8),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                boxShadow: [
                                  BoxShadow(
                                    color:
                                        theme.colorScheme.primary.withAlpha(24),
                                    blurRadius: 2,
                                    offset: Offset(0, 1),
                                  ),
                                ],
                              ),
                              child: ElevatedButton(
                                onPressed: () {
                                  _pickTime(context);
                                },
                                style: ButtonStyle(
                                    padding: MaterialStateProperty.all(
                                        MySpacing.xy(16, 0))),
                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                      LucideIcons.clock,
                                      color: theme.colorScheme.onPrimary,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: MyText.bodyMedium("Select Time",
                                          fontWeight: 600,
                                          color: theme.colorScheme.onPrimary,
                                          letterSpacing: 0.3),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            margin: EdgeInsets.only(left: 8),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                boxShadow: [
                                  BoxShadow(
                                    color:
                                        theme.colorScheme.primary.withAlpha(24),
                                    blurRadius: 2,
                                    offset: Offset(0, 1),
                                  ),
                                ],
                              ),
                              child: ElevatedButton(
                                onPressed: () {
                                  _pickDate(context);
                                },
                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                      LucideIcons.calendar,
                                      color: theme.colorScheme.onPrimary,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: MyText.bodyMedium("Select Date",
                                          fontWeight: 600,
                                          color: theme.colorScheme.onPrimary,
                                          letterSpacing: 0.3),
                                    ),
                                  ],
                                ),
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
                    padding: EdgeInsets.only(
                        left: 16, right: 16, top: 16, bottom: 8),
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
                    min: 0,
                    max: 100,
                  ),
                  Slider(
                    value: _sliderValue2,
                    min: 0,
                    max: 100,
                    divisions: 100,
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
                    values: RangeValues(_starValue, _endValue),
                    min: 0.0,
                    max: 100.0,
                    labels: RangeLabels("1", "2"),
                    onChanged: (values) {
                      setState(() {
                        _starValue = values.start.roundToDouble();
                        _endValue = values.end.roundToDouble();
                      });
                    },
                    activeColor: theme.sliderTheme.activeTrackColor,
                    inactiveColor: theme.sliderTheme.inactiveTrackColor,
                  ),
                  Divider(
                    color: theme.dividerColor,
                    thickness: 1,
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        left: 16, right: 16, top: 16, bottom: 0),
                    child: MyText.titleMedium("Switch",
                        fontWeight: 600, letterSpacing: 0.2),
                  ),
                  Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 16),
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
                    padding: EdgeInsets.only(
                        left: 16, right: 16, top: 16, bottom: 0),
                    child: MyText.titleMedium("Checkboxes",
                        fontWeight: 600, letterSpacing: 0.2),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
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
                            MyText.titleSmall(
                              "Check 1",
                            )
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
                            MyText.titleSmall(
                              "Check 2",
                            )
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
                            MyText.titleSmall(
                              "Check 3",
                            )
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
                    padding: EdgeInsets.only(
                        left: 16, right: 16, top: 16, bottom: 0),
                    child: MyText.titleMedium("Radio Buttons",
                        fontWeight: 600, letterSpacing: 0.2),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          title: MyText.bodyLarge(
                            "Radio 1",
                          ),
                          contentPadding: EdgeInsets.all(0),
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
                          title: MyText.bodyLarge(
                            "Radio 2",
                          ),
                          contentPadding: EdgeInsets.all(0),
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
                          title: MyText.bodyLarge(
                            "Radio 3",
                          ),
                          contentPadding: EdgeInsets.all(0),
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
            ));
      },
    );
  }

  void showSnackbarWithFloating(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: MyText.titleSmall(message, color: theme.colorScheme.onPrimary),
        backgroundColor: theme.colorScheme.primary,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
