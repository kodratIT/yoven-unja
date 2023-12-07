import 'package:jambicraff/helpers/theme/app_theme.dart';
import 'package:jambicraff/helpers/widgets/my_button.dart';
import 'package:jambicraff/helpers/widgets/my_spacing.dart';
import 'package:jambicraff/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';

class MyButtonsScreen extends StatefulWidget {
  @override
  _MyButtonsScreenState createState() => _MyButtonsScreenState();
}

class _MyButtonsScreenState extends State<MyButtonsScreen> {
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
    return Scaffold(
      body: ListView(
        padding: MySpacing.all(24),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyButton.small(
                onPressed: () {},
                elevation: 0,
                splashColor: theme.colorScheme.onPrimary.withAlpha(60),
                backgroundColor: theme.primaryColor,
                child: MyText.bodyMedium(
                  'Small',
                  color: theme.colorScheme.onPrimary,
                ),
              ),
              MyButton.medium(
                onPressed: () {},
                elevation: 0,
                splashColor: theme.colorScheme.onPrimary.withAlpha(60),
                backgroundColor: theme.primaryColor,
                child: MyText.bodyMedium(
                  'Medium',
                  color: theme.colorScheme.onPrimary,
                ),
              ),
              MyButton.large(
                onPressed: () {},
                elevation: 0,
                splashColor: theme.colorScheme.onPrimary.withAlpha(60),
                backgroundColor: theme.primaryColor,
                child: MyText.bodyMedium(
                  'Large',
                  color: theme.colorScheme.onPrimary,
                ),
              ),
            ],
          ),
          MySpacing.height(24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyButton.small(
                buttonType: MyButtonType.outlined,
                splashColor: theme.colorScheme.primary.withAlpha(60),
                borderColor: theme.primaryColor,
                onPressed: () {},
                elevation: 0,
                child: MyText.bodyMedium(
                  'Small',
                  color: theme.primaryColor,
                ),
              ),
              MyButton.medium(
                buttonType: MyButtonType.outlined,
                borderColor: theme.primaryColor,
                splashColor: theme.colorScheme.primary.withAlpha(60),
                onPressed: () {},
                elevation: 0,
                child: MyText.bodyMedium(
                  'Medium',
                  color: theme.primaryColor,
                ),
              ),
              MyButton.large(
                buttonType: MyButtonType.outlined,
                borderColor: theme.primaryColor,
                splashColor: theme.colorScheme.primary.withAlpha(60),
                onPressed: () {},
                elevation: 0,
                child: MyText.bodyMedium(
                  'Large',
                  color: theme.primaryColor,
                ),
              ),
            ],
          ),
          MySpacing.height(24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyButton.small(
                borderRadiusAll: 4,
                backgroundColor: theme.primaryColor,
                onPressed: () {},
                elevation: 0,
                splashColor: theme.colorScheme.onPrimary.withAlpha(60),
                child: MyText.bodyMedium(
                  'Small',
                  color: theme.colorScheme.onPrimary,
                ),
              ),
              MyButton.medium(
                borderRadiusAll: 4,
                backgroundColor: theme.primaryColor,
                onPressed: () {},
                elevation: 0,
                splashColor: theme.colorScheme.onPrimary.withAlpha(60),
                child: MyText.bodyMedium(
                  'Medium',
                  color: theme.colorScheme.onPrimary,
                ),
              ),
              MyButton.large(
                borderRadiusAll: 4,
                backgroundColor: theme.primaryColor,
                onPressed: () {},
                elevation: 0,
                splashColor: theme.colorScheme.onPrimary.withAlpha(60),
                child: MyText.bodyMedium(
                  'Large',
                  color: theme.colorScheme.onPrimary,
                ),
              ),
            ],
          ),
          MySpacing.height(24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyButton.small(
                onPressed: () {},
                elevation: 0,
                splashColor: theme.primaryColor.withAlpha(40),
                buttonType: MyButtonType.text,
                child: MyText.bodyMedium(
                  'Small',
                  color: theme.colorScheme.primary,
                ),
              ),
              MyButton.medium(
                onPressed: () {},
                elevation: 0,
                buttonType: MyButtonType.text,
                splashColor: theme.primaryColor.withAlpha(40),
                child: MyText.bodyMedium(
                  'Medium',
                  color: theme.colorScheme.primary,
                ),
              ),
              MyButton.large(
                onPressed: () {},
                elevation: 0,
                buttonType: MyButtonType.text,
                splashColor: theme.primaryColor.withAlpha(40),
                child: MyText.bodyMedium(
                  'Large',
                  color: theme.colorScheme.primary,
                ),
              ),
            ],
          ),
          MySpacing.height(24),
          MyButton.block(
            onPressed: () {},
            elevation: 0,
            splashColor: theme.colorScheme.onPrimary.withAlpha(60),
            backgroundColor: theme.primaryColor,
            child: MyText.bodyMedium(
              'Block',
              color: theme.colorScheme.onPrimary,
            ),
          ),
          MySpacing.height(24),
          MyButton.block(
            onPressed: () {},
            elevation: 8,
            splashColor: theme.colorScheme.onPrimary.withAlpha(60),
            backgroundColor: theme.primaryColor,
            child: MyText.bodyMedium(
              'Elevation',
              color: theme.colorScheme.onPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
