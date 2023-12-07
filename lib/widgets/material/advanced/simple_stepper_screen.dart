/*
* File : Simple Stepper
* Version : 1.0.0
* */

import 'package:yoven/helpers/theme/app_theme.dart';
import 'package:yoven/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';

class SimpleStepperScreen extends StatefulWidget {
  @override
  _SimpleStepperScreenState createState() => _SimpleStepperScreenState();
}

class _SimpleStepperScreenState extends State<SimpleStepperScreen> {
  late ThemeData theme;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  int _currentStep = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Stepper(
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
            title: MyText.titleMedium('Step 1', fontWeight: 600),
            content: SizedBox(
                height: 60.0,
                child: MyText.titleSmall("Completed (content is here)",
                    fontWeight: 500)),
          ),
          Step(
            isActive: true,
            state: StepState.complete,
            title: MyText.titleMedium('Step 2', fontWeight: 600),
            content: SizedBox(
                height: 60.0,
                child: MyText.titleSmall("Completed (content is here)",
                    fontWeight: 500)),
          ),
          Step(
            isActive: true,
            state: StepState.editing,
            title: MyText.titleMedium('Step 3', fontWeight: 600),
            content: SizedBox(
                height: 60.0,
                child: MyText.titleSmall("Editing (content is here)",
                    fontWeight: 500)),
          ),
          Step(
            isActive: true,
            title: MyText.titleMedium('Step 4', fontWeight: 600),
            content: SizedBox(
                height: 60.0,
                child: MyText.titleSmall("Uncompleted (content is here)",
                    fontWeight: 500)),
          ),
          Step(
            state: StepState.disabled,
            title: MyText.titleMedium('Step 5', fontWeight: 600),
            content: SizedBox(
                height: 60.0,
                child: MyText.titleSmall("Disabled (content is here)",
                    fontWeight: 500)),
          ),
        ],
      ),
    ));
  }
}
