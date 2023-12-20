import 'package:get/get.dart';
import 'package:yoven/auth/login_screen.dart';
import 'package:yoven/auth/register_screen.dart';
import 'package:yoven/helpers/theme/app_notifier.dart';
import 'package:yoven/helpers/theme/app_theme.dart';
import 'package:yoven/helpers/widgets/my_button.dart';
import 'package:yoven/helpers/widgets/my_spacing.dart';
import 'package:yoven/helpers/widgets/my_text.dart';
import 'package:yoven/helpers/widgets/my_text_style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late ThemeData theme;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
    MyTextStyle.changeFontFamily(GoogleFonts.quicksand);
    MyTextStyle.changeDefaultFontWeight({
      100: FontWeight.w200,
      200: FontWeight.w300,
      300: FontWeight.w400,
      400: FontWeight.w500,
      500: FontWeight.w600,
      600: FontWeight.w700,
      700: FontWeight.w800,
      800: FontWeight.w900,
      900: FontWeight.w900,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppNotifier>(
      builder: (BuildContext context, AppNotifier value, Widget? child) {
        return Theme(
          data: theme.copyWith(
              colorScheme: theme.colorScheme
                  .copyWith(secondary: customTheme.medicarePrimary)),
          child: Scaffold(
            body: Container(
              margin: MySpacing.fromLTRB(24, 100, 24, 32),
              child: Column(
                children: [
                  MyText.displaySmall(
                    "Welcome to Yoven Unja",
                    color: customTheme.medicarePrimary,
                  ),
                  Expanded(
                    child: Center(
                      child: Image(
                        image: AssetImage(
                            'assets/images/event/splash_screen.png'),
                        width: 320,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: MyButton.text(
                        splashColor: customTheme.medicarePrimary.withAlpha(40),
                        padding: MySpacing.y(8),
                        onPressed: () {
                          // Navigator.of(context, rootNavigator: true).push(
                          //   MaterialPageRoute(
                          //       builder: (context) =>
                          //           Register()),
                          // );
                          Get.off(Register());
                        },
                        child: MyText.labelLarge(
                          "SIGN UP",
                          color: customTheme.medicarePrimary,
                          letterSpacing: 0.5,
                        ),
                      )),
                      Expanded(
                          child: MyButton(
                        elevation: 0,
                        padding: MySpacing.y(20),
                        borderRadiusAll: 4,
                        onPressed: () {
                          // Navigator.of(context, rootNavigator: true).push(
                          //   MaterialPageRoute(
                          //       builder: (context) => Login()),
                          // );

                          Get.off(Login());

                        },
                        backgroundColor: customTheme.medicarePrimary,
                        child: MyText.labelLarge(
                          "LOG IN",
                          color: customTheme.medicareOnPrimary,
                          letterSpacing: 0.5,
                        ),
                      )),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
