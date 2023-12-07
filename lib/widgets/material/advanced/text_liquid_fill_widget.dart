import 'package:jambicraff/helpers/theme/app_theme.dart';
import 'package:jambicraff/helpers/widgets/my_text_style.dart';
import 'package:jambicraff/widgets/custom/text_liquid_fill.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:lucide_icons/lucide_icons.dart';

class TextLiquidFillWidget extends StatefulWidget {
  @override
  _TextLiquidFillWidgetState createState() => _TextLiquidFillWidgetState();
}

class _TextLiquidFillWidgetState extends State<TextLiquidFillWidget> {
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
      tag: 'text_liquid_fill_widget',
      builder: (controller) {
        return Scaffold(
            backgroundColor: Colors.black,
            body: ListView(
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(LucideIcons.chevronLeft),
                  ),
                ),
                TextLiquidFill(
                    text: "FLUTTER",
                    loadDuration: Duration(seconds: 15),
                    waveDuration: Duration(milliseconds: 600),
                    waveColor: Colors.blue,
                    textStyle: MyTextStyle.displayMedium(
                        fontWeight: 800, letterSpacing: 0.5)),
                TextLiquidFill(
                    text: "UIKIT",
                    loadDuration: Duration(seconds: 15),
                    waveDuration: Duration(milliseconds: 700),
                    waveColor: Colors.red,
                    textStyle: MyTextStyle.displayMedium(
                        fontWeight: 800, letterSpacing: 0.5)),
                TextLiquidFill(
                    text: "LIQUID",
                    loadDuration: Duration(seconds: 15),
                    waveDuration: Duration(milliseconds: 800),
                    waveColor: Colors.green,
                    textStyle: MyTextStyle.displayMedium(
                        fontWeight: 800, letterSpacing: 0.5)),
                TextLiquidFill(
                    text: "EFFECT",
                    loadDuration: Duration(seconds: 15),
                    waveDuration: Duration(milliseconds: 900),
                    waveColor: Colors.yellow,
                    textStyle: MyTextStyle.displayMedium(
                        fontWeight: 800, letterSpacing: 0.5)),
              ],
            ));
      },
    );
  }
}
