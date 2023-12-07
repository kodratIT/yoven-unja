/*
* File : Text Field
* Version : 1.0.0
* */

import 'package:jambicraff/helpers/theme/app_theme.dart';
import 'package:jambicraff/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:lucide_icons/lucide_icons.dart';

class TextFieldWidget extends StatefulWidget {
  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

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
    return GetBuilder(
      tag: 'text_field_widget',
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
              title: MyText.titleMedium("Text Fields", fontWeight: 600),
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 0),
                    child: MyText.titleMedium("Bordered (with label)",
                        fontWeight: 600),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: "Name",
                            hintText: "Name",
                            border: theme.inputDecorationTheme.border,
                            enabledBorder: theme.inputDecorationTheme.border,
                            focusedBorder:
                                theme.inputDecorationTheme.focusedBorder,
                            prefixIcon: Icon(Icons.person),
                          ),
                          controller:
                              TextEditingController(text: "Natalia Dyer"),
                          textCapitalization: TextCapitalization.sentences,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: "Email",
                              hintText: "Email",
                              border: theme.inputDecorationTheme.border,
                              enabledBorder: theme.inputDecorationTheme.border,
                              focusedBorder:
                                  theme.inputDecorationTheme.focusedBorder,
                              prefixIcon: Icon(Icons.email),
                            ),
                            controller:
                                TextEditingController(text: "nat@mail.com"),
                            textCapitalization: TextCapitalization.sentences,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 24, left: 20, right: 20),
                    child: MyText.titleMedium("Bordered  (without label)",
                        fontWeight: 600),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: "Name",
                            border: theme.inputDecorationTheme.border,
                            enabledBorder: theme.inputDecorationTheme.border,
                            focusedBorder:
                                theme.inputDecorationTheme.focusedBorder,
                            prefixIcon: Icon(Icons.person),
                          ),
                          controller:
                              TextEditingController(text: "Natalia Dyer"),
                          textCapitalization: TextCapitalization.sentences,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: "Email",
                              border: theme.inputDecorationTheme.border,
                              enabledBorder: theme.inputDecorationTheme.border,
                              focusedBorder:
                                  theme.inputDecorationTheme.focusedBorder,
                              prefixIcon: Icon(Icons.email),
                            ),
                            controller:
                                TextEditingController(text: "nat@mail.com"),
                            textCapitalization: TextCapitalization.sentences,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 24, left: 20, right: 20),
                    child: MyText.titleMedium("Borderless (with label)",
                        fontWeight: 600),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: "Name",
                            hintText: "Name",
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            prefixIcon: Icon(Icons.person),
                          ),
                          controller:
                              TextEditingController(text: "Natalia Dyer"),
                          textCapitalization: TextCapitalization.sentences,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: "Email",
                              hintText: "Email",
                              border: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              prefixIcon: Icon(Icons.email),
                            ),
                            controller:
                                TextEditingController(text: "nat@mail.com"),
                            textCapitalization: TextCapitalization.sentences,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 24, left: 20, right: 20),
                    child: MyText.titleMedium("Borderless (without label)",
                        fontWeight: 600),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: "Name",
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            prefixIcon: Icon(Icons.person),
                          ),
                          textCapitalization: TextCapitalization.sentences,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: "Email",
                              border: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              prefixIcon: Icon(Icons.email),
                            ),
                            textCapitalization: TextCapitalization.sentences,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 24, left: 20, right: 20),
                    child: MyText.titleMedium("Border bottom (without label)",
                        fontWeight: 600),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: "Name",
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppTheme.customTheme.border),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppTheme.customTheme.border),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppTheme.customTheme.border),
                            ),
                            prefixIcon: Icon(Icons.person),
                          ),
                          textCapitalization: TextCapitalization.sentences,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: "Email",
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppTheme.customTheme.border),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppTheme.customTheme.border),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppTheme.customTheme.border),
                              ),
                              prefixIcon: Icon(Icons.email),
                            ),
                            textCapitalization: TextCapitalization.sentences,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 24, left: 20, right: 20),
                    child: MyText.titleMedium("Filled (without label)",
                        fontWeight: 600),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          style:
                              TextStyle(color: theme.colorScheme.onBackground),
                          decoration: InputDecoration(
                            fillColor: theme.colorScheme.background,
                            hintStyle: TextStyle(
                                color: theme.colorScheme.onBackground),
                            filled: true,
                            hintText: "Name",
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            prefixIcon: Icon(Icons.person),
                          ),
                          textCapitalization: TextCapitalization.sentences,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: TextFormField(
                            style: TextStyle(
                                color: theme.colorScheme.onBackground),
                            decoration: InputDecoration(
                              fillColor: theme.colorScheme.background,
                              hintStyle: TextStyle(
                                  color: theme.colorScheme.onBackground),
                              filled: true,
                              hintText: "Email",
                              border: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              prefixIcon: Icon(Icons.email),
                            ),
                            textCapitalization: TextCapitalization.sentences,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 24, left: 20, right: 20),
                    child: MyText.titleMedium("Rounded (with label)",
                        fontWeight: 600),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "Search",
                        hintText: "Ask me anything",
                        labelStyle: theme.textTheme.titleSmall!.merge(TextStyle(
                            color:
                                theme.colorScheme.onBackground.withAlpha(200),
                            letterSpacing: 0.2)),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1.2,
                              color: theme.colorScheme.onBackground
                                  .withAlpha(120)),
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1.2,
                              color: theme.colorScheme.onBackground
                                  .withAlpha(120)),
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1.5, color: theme.colorScheme.secondary),
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                        ),
                        prefixIcon: Icon(
                          LucideIcons.search,
                          size: 22,
                          color: theme.colorScheme.onBackground.withAlpha(200),
                        ),
                        isDense: true,
                        contentPadding: EdgeInsets.all(0),
                      ),
                      textCapitalization: TextCapitalization.sentences,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 24, left: 20, right: 20),
                    child: MyText.titleMedium("Rounded (without label)",
                        fontWeight: 600),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: "Search",
                            labelStyle: theme.textTheme.titleSmall!.merge(
                                TextStyle(
                                    color: theme.colorScheme.onBackground
                                        .withAlpha(200),
                                    letterSpacing: 0.2)),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1.2,
                                  color: theme.colorScheme.onBackground
                                      .withAlpha(120)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1.2,
                                  color: theme.colorScheme.onBackground
                                      .withAlpha(120)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1.5,
                                  color: theme.colorScheme.secondary),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40)),
                            ),
                            prefixIcon: Icon(
                              LucideIcons.search,
                              size: 22,
                              color:
                                  theme.colorScheme.onBackground.withAlpha(200),
                            ),
                            isDense: true,
                            contentPadding: EdgeInsets.all(0),
                          ),
                          textCapitalization: TextCapitalization.sentences,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 24, left: 20, right: 20),
                    child: MyText.titleMedium("Password", fontWeight: 600),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: Column(
                      children: <Widget>[
                        TextFormField(
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
                          textCapitalization: TextCapitalization.sentences,
                          obscureText: _passwordVisible,
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
