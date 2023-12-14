/*
* File : Register
* Version : 1.0.0
* */

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:yoven/auth/firebase_auth_/firebase_auth_services.dart';
import 'package:yoven/auth/firebase_auth_/showToast.dart';
import 'package:yoven/auth/login_screen.dart';
import 'package:yoven/helpers/theme/app_theme.dart';
import 'package:yoven/helpers/widgets/my_button.dart';
import 'package:yoven/helpers/widgets/my_container.dart';
import 'package:yoven/helpers/widgets/my_spacing.dart';
import 'package:yoven/helpers/widgets/my_text.dart';
import 'package:yoven/helpers/widgets/my_text_style.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:yoven/event/event_full_app.dart';
import 'package:yoven/model/UserModel.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RegisterScreen createState() => _RegisterScreen();
}

class _RegisterScreen extends State<Register> {

  final FirebaseAuthService _auth = FirebaseAuthService();

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _numberController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool isSigningUp = false;
   @override
  void dispose() {
    _usernameController.dispose();
    _numberController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

   Future<void> _createDetailUser(UserModel userDetail) async {
  try {
    // Assuming 'user_details' is the collection name for user details
    await FirebaseFirestore.instance.collection('users').add({
      'id': userDetail.id,
      'name': userDetail.name,
      'phone_number': userDetail.mobilePhone,
    });

    print('User details added successfully');
  } catch (e) {
    print('Error adding user details: $e');
    }
  }


  void CreateData(String _id,String name,int phone)async{
    UserModel UserNew = UserModel(
      id: _id,
      name: name,
      mobilePhone:phone,
      createdAt: DateTime.now()
    );

    await _createDetailUser(UserNew);
  }

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
                              controller: _usernameController,
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
                              controller: _emailController,

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
                              controller: _numberController,

                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 16),
                            child: TextFormField(
                              controller: _passwordController,
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
                                    onPressed: () {
                                      _signUp();
                                    },
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
                      MaterialPageRoute(builder: (context) => const Login()));
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
      ],
    ));
  }

   void _signUp() async {

    setState(() {
      isSigningUp = true;
    });

    // String username = _usernameController.text;
    // String number = _numberController.text;
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signUpWithEmailAndPassword(email, password);

    setState(() {
      isSigningUp = false;
    });

    if (user != null) {

      CreateData(user.uid,_usernameController.text,int.parse(_numberController.text));
      showToast(message: "User is successfully created");
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => EventFullApp()));
    } else {
      showToast(message: "Some error happend");
    }
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
