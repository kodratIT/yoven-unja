/*
* File : Timeline Stepper
* Version : 1.0.0
* */

import 'package:yoven/helpers/theme/app_theme.dart';
import 'package:yoven/helpers/widgets/my_button.dart';
import 'package:yoven/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:lucide_icons/lucide_icons.dart';

class TimelineStepperWidget extends StatefulWidget {
  @override
  _TimelineStepperWidgetState createState() => _TimelineStepperWidgetState();
}

class _TimelineStepperWidgetState extends State<TimelineStepperWidget> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  int _currentStep = 3;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      tag: 'timeline_stepper_widget',
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
              title: MyText.titleMedium("Timeline Stepper", fontWeight: 600),
            ),
            body: SingleChildScrollView(
              child: Stepper(
                controlsBuilder:
                    (BuildContext context, ControlsDetails details) {
                  return Container(
                    margin: EdgeInsets.only(top: 8),
                    child: Center(
                      child: MyButton(
                          onPressed: () {},
                          elevation: 2,
                          borderRadiusAll: 4,
                          child: MyText.bodySmall("Contact".toUpperCase(),
                              fontWeight: 600,
                              letterSpacing: 0.4,
                              color: theme.colorScheme.onPrimary)),
                    ),
                  );
                },
                currentStep: _currentStep,
                onStepContinue: () {
                  if (_currentStep >= 4) return;
                  setState(() {
                    _currentStep += 1;
                  });
                },
                onStepCancel: () {
                  if (_currentStep <= 0) return;
                  setState(() {
                    _currentStep -= 1;
                  });
                },
                onStepTapped: (pos) {
                  setState(() {
                    _currentStep = pos;
                  });
                },
                steps: <Step>[
                  Step(
                      isActive: true,
                      state: StepState.complete,
                      title: MyText.bodyLarge('Completed - 14, Apr',
                          fontWeight: 600),
                      content: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
                                  width: 44,
                                  height: 44,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "./assets/images/profile/avatar_2.jpg"),
                                        fit: BoxFit.fill),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 8),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      MyText.bodySmall("Assigned to",
                                          fontWeight: 500),
                                      MyText.bodyLarge("Mark Laurren",
                                          fontWeight: 600),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 8),
                              child: MyText.bodySmall(
                                  " - It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.,",
                                  color: theme.colorScheme.onBackground),
                            )
                          ],
                        ),
                      )),
                  Step(
                    isActive: true,
                    state: StepState.complete,
                    title: MyText.bodyLarge('Completed - 16, Apr',
                        fontWeight: 600),
                    content: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                width: 44,
                                height: 44,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "./assets/images/profile/avatar.jpg"),
                                      fit: BoxFit.fill),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    MyText.bodySmall("Assigned to",
                                        fontWeight: 500),
                                    MyText.bodyLarge("Robert Downey",
                                        fontWeight: 600),
                                  ],
                                ),
                              )
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 8),
                            child: MyText.bodySmall(
                                " - It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.,",
                                color: theme.colorScheme.onBackground),
                          )
                        ],
                      ),
                    ),
                  ),
                  Step(
                    state: StepState.disabled,
                    title: MyText.bodyLarge("Task Removed", fontWeight: 500),
                    content: Container(),
                  ),
                  Step(
                    isActive: true,
                    title: MyText.bodyLarge('Working (due date - 24 Apr)',
                        fontWeight: 600),
                    state: StepState.editing,
                    content: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                width: 44,
                                height: 44,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "./assets/images/profile/avatar_2.jpg"),
                                      fit: BoxFit.fill),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    MyText.bodySmall("Assigned to",
                                        fontWeight: 500),
                                    MyText.bodyLarge("Mark Laurren",
                                        fontWeight: 600),
                                  ],
                                ),
                              )
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 8),
                            child: MyText.bodySmall(
                                " - It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.,",
                                color: theme.colorScheme.onBackground),
                          )
                        ],
                      ),
                    ),
                  ),
                  Step(
                    isActive: true,
                    state: StepState.indexed,
                    title: MyText.bodyLarge('Upcoming Task', fontWeight: 600),
                    content: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                width: 44,
                                height: 44,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "./assets/images/profile/avatar_1.jpg"),
                                      fit: BoxFit.fill),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    MyText.bodySmall("Assign to",
                                        fontWeight: 500),
                                    MyText.bodyLarge("Nat Bentlee",
                                        fontWeight: 600),
                                  ],
                                ),
                              )
                            ],
                          ),
                          Container(
                              margin: EdgeInsets.only(top: 8),
                              child: MyText.bodySmall(
                                  " - It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.,",
                                  fontWeight: 500))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ));
      },
    );
  }
}
