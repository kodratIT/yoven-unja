import 'package:yoven/register.dart';
// import 'package:yoven/homepage.dart';
import 'package:yoven/full.dart';
import 'package:yoven/helpers/theme/app_theme.dart';
import 'package:yoven/helpers/widgets/my_button.dart';
import 'package:yoven/helpers/widgets/my_container.dart';
import 'package:yoven/helpers/widgets/my_spacing.dart';
import 'package:yoven/helpers/widgets/my_text.dart';
import 'package:yoven/helpers/widgets/my_text_style.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class Login2Screen extends StatefulWidget {
  const Login2Screen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _Login2ScreenState createState() => _Login2ScreenState();
}

class _Login2ScreenState extends State<Login2Screen> {
  bool? _passwordVisible = false, _check = false;
  // late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    // customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        ClipPath(
        
            child: Container(
              alignment: Alignment.center,
              color: theme.colorScheme.background,
            )),
        Positioned(
          left: 30,
          right: 30,
          top: MediaQuery.of(context).size.height * 0.2,
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              MyContainer.bordered(
                padding: const EdgeInsets.only(top: 16, bottom: 16),
                color: theme.scaffoldBackgroundColor,
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(bottom: 24, top: 8),
                      child: MyText.titleLarge("LOGIN", fontWeight: 600),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            style: MyTextStyle.bodyLarge(
                                letterSpacing: 0.1,
                                color: theme.colorScheme.onBackground,
                                fontWeight: 500),
                            decoration: InputDecoration(
                              hintText: "Email",
                              hintStyle: MyTextStyle.titleSmall(
                                  letterSpacing: 0.1,
                                  color: theme.colorScheme.onBackground,
                                  fontWeight: 500),
                              prefixIcon: const Icon(LucideIcons.mail),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 16),
                            child: TextFormField(
                              style: MyTextStyle.bodyLarge(
                                  letterSpacing: 0.1,
                                  color: theme.colorScheme.onBackground,
                                  fontWeight: 500),
                              decoration: InputDecoration(
                                hintText: "Password",
                                hintStyle: MyTextStyle.titleSmall(
                                    letterSpacing: 0.1,
                                    color: theme.colorScheme.onBackground,
                                    fontWeight: 500),
                                prefixIcon: const Icon(LucideIcons.lock),
                                suffixIcon: IconButton(
                                  icon: Icon(_passwordVisible!
                                      ? LucideIcons.eye
                                      : LucideIcons.eyeOff),
                                  onPressed: () {
                                    setState(() {
                                      _passwordVisible = !_passwordVisible!;
                                    });
                                  },
                                ),
                              ),
                              obscureText: _passwordVisible!,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 16),
                            alignment: Alignment.centerRight,
                            child: MyText.bodyMedium("Forgot Password?",
                                fontWeight: 500),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Row(
                              children: <Widget>[
                                Checkbox(
                                  activeColor: theme.colorScheme.primary,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      _check = value;
                                    });
                                  },
                                  value: _check,
                                  visualDensity: VisualDensity.compact,
                                ),
                                MyText(
                                  "Remember me",
                                )
                              ],
                            ),
                          ),

                          Container(
                            margin: const EdgeInsets.only(top: 16),
                            child: MyButton.block(
                                elevation: 0,
                                borderRadiusAll: 4,
                                padding: MySpacing.y(20),
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(builder: (context) => FullApp()),
                                  );
                                },
                                child: MyText.labelMedium("LOGIN",
                                    fontWeight: 600,
                                    color: theme.colorScheme.onPrimary,
                                    letterSpacing: 0.5)),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 16),
                            child: Center(
                              child: MyText.bodyMedium("OR", fontWeight: 500),
                            ),
                          ),
                          MyButton.block(
                              elevation: 0,
                              borderRadiusAll: 4,
                              padding: MySpacing.y(20),
                              onPressed: () {},
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  MyText.bodyLarge("Login with Google",
                                      fontWeight: 600,
                                      color: theme.colorScheme.onPrimary,
                                      letterSpacing: 0.3),
                                ],
                              )),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>  Register2Screen()));
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 16),
                  child: Center(
                    child: RichText(
                      text: TextSpan(children: <TextSpan>[
                        TextSpan(
                            text: "Don't have an Account? ",
                            style: MyTextStyle.bodyMedium(fontWeight: 500)),
                        TextSpan(
                            text: " Register",
                            style: MyTextStyle.bodyMedium(
                                fontWeight: 600,
                                color: theme.colorScheme.primary)),
                      ]),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    ));
  }
}

class _MyCustomClipper extends CustomClipper<Path> {
  final BuildContext _context;

  _MyCustomClipper(this._context);

  @override
  Path getClip(Size size) {
    final path = Path();
    Size size = MediaQuery.of(_context).size;
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height * 0.3);
    path.lineTo(0, size.height * 0.6);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}
