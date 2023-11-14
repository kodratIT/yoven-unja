/*
* File : Register
* Version : 1.0.0
* */

import 'package:yoven/login.dart';
import 'package:yoven/helpers/theme/app_theme.dart';
import 'package:yoven/helpers/widgets/my_button.dart';
import 'package:yoven/helpers/widgets/my_container.dart';
import 'package:yoven/helpers/widgets/my_spacing.dart';
import 'package:yoven/helpers/widgets/my_text.dart';
import 'package:yoven/helpers/widgets/my_text_style.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class Register2Screen extends StatefulWidget {
  const Register2Screen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _Register2ScreenState createState() => _Register2ScreenState();
}

class _Register2ScreenState extends State<Register2Screen> {
  bool _passwordVisible = false;
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
        body: Stack(
      children: <Widget>[
        ClipPath(
            clipper: _MyCustomClipper(context),
            child: Container(
              alignment: Alignment.center,
              color: theme.colorScheme.background,
            )),
        Positioned(
          left: 30,
          right: 30,
          top: MediaQuery.of(context).size.height * 0.15,
          child: Column(
            children: <Widget>[
              MyContainer.bordered(
                color: theme.scaffoldBackgroundColor,
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(top: 8),
                      child: MyText.titleLarge("REGISTER", fontWeight: 600),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
                      child: Column(
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.only(top: 16),
                            child: TextFormField(
                              style: MyTextStyle.bodyLarge(
                                  color: theme.colorScheme.onBackground,
                                  fontWeight: 500),
                              decoration: InputDecoration(
                                hintText: "Name",
                                hintStyle: MyTextStyle.bodyLarge(
                                    color: theme.colorScheme.onBackground,
                                    fontWeight: 500),
                                prefixIcon: const Icon(LucideIcons.user),
                              ),
                              textCapitalization: TextCapitalization.sentences,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 16),
                            child: TextFormField(
                              style: MyTextStyle.bodyLarge(
                                  color: theme.colorScheme.onBackground,
                                  fontWeight: 500),
                              decoration: InputDecoration(
                                hintText: "Email",
                                hintStyle: MyTextStyle.bodyLarge(
                                    color: theme.colorScheme.onBackground,
                                    fontWeight: 500),
                                prefixIcon: const Icon(LucideIcons.mail),
                              ),
                              keyboardType: TextInputType.emailAddress,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 16),
                            child: TextFormField(
                              style: MyTextStyle.bodyLarge(
                                  color: theme.colorScheme.onBackground,
                                  fontWeight: 500),
                              decoration: InputDecoration(
                                hintText: "Number",
                                hintStyle: MyTextStyle.bodyLarge(
                                    color: theme.colorScheme.onBackground,
                                    fontWeight: 500),
                                prefixIcon: const Icon(LucideIcons.phone),
                              ),
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 16),
                            child: TextFormField(
                              style: MyTextStyle.bodyLarge(
                                  color: theme.colorScheme.onBackground,
                                  fontWeight: 500),
                              decoration: InputDecoration(
                                hintText: "Password",
                                hintStyle: MyTextStyle.bodyLarge(
                                    color: theme.colorScheme.onBackground,
                                    fontWeight: 500),
                                prefixIcon: const Icon(LucideIcons.lock),
                                suffixIcon: IconButton(
                                  icon: Icon(_passwordVisible
                                      ? LucideIcons.eye
                                      : LucideIcons.eyeOff),
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
                          Container(
                              margin: const EdgeInsets.only(top: 24),
                              child: MyButton(
                                  elevation: 0,
                                  borderRadiusAll: 4,
                                  onPressed: () {},
                                  padding: MySpacing.xy(20, 20),
                                  child: MyText.labelMedium("REGISTER",
                                      fontWeight: 600,
                                      color: theme.colorScheme.onPrimary))),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => const Login2Screen()));
                },
                child: Container(
                  padding: const EdgeInsets.only(top: 16, bottom: 8),
                  child: RichText(
                    text: TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: "I've already an Account? ",
                          style: MyTextStyle.bodyMedium(fontWeight: 500)),
                      TextSpan(
                          text: " Login",
                          style: MyTextStyle.bodyMedium(
                              fontWeight: 600,
                              color: theme.colorScheme.primary)),
                    ]),
                  ),
                ),
              )
            ],
          ),
        ),
        // Positioned(
        //   top: MySpacing.safeAreaTop(context) + 12,
        //   left: 16,
        //   child: InkWell(
        //     onTap: () {    
        //       Navigator.pop(context);
        //     },
        //     child: Icon(
        //       LucideIcons.chevronLeft,
        //       color: theme.colorScheme.onBackground,
        //     ),
        //   ),
        // )
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
