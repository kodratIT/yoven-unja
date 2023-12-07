import 'package:jambicraff/helpers/extensions/widgets_extension.dart';
import 'package:jambicraff/helpers/theme/app_theme.dart';
import 'package:jambicraff/helpers/widgets/my_text.dart';
import 'package:jambicraff/widgets/material/input/address_form.dart';
import 'package:jambicraff/widgets/material/input/date_timer_picker_screen.dart';
import 'package:jambicraff/widgets/material/input/feedback_form.dart';
import 'package:jambicraff/widgets/material/input/form_screen.dart';
import 'package:jambicraff/widgets/material/input/personal_information_form.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class InputsScreen extends StatefulWidget {
  @override
  _InputsScreenState createState() => _InputsScreenState();
}

class _InputsScreenState extends State<InputsScreen> {
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            LucideIcons.chevronLeft,
            size: 20,
          ).autoDirection(),
        ),
        title: MyText.titleMedium(
          'Inputs',
          fontWeight: 600,
        ),
      ),
      body: DefaultTabController(
        length: 5,
        initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
            elevation: 1,
            automaticallyImplyLeading: false,
            toolbarHeight: 48,
            flexibleSpace: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                /*-------------- Build Tabs here ------------------*/
                TabBar(isScrollable: true, tabs: getTabs())
              ],
            ),
          ),

          /*--------------- Build Tab body here -------------------*/
          body: TabBarView(children: getTabContents()),
        ),
      ),
    );
  }

  List<Tab> getTabs() {
    List<String> tabNames = [
      'Sample',
      'Date-Time',
      'Address',
      'Feedback',
      'Personal Information',
      // 'Selectable',
    ];

    List<Tab> tabs = [];

    for (String tabName in tabNames) {
      tabs.add(Tab(
          child: MyText.labelMedium(
        tabName,
        fontWeight: 700,
      )));
    }

    return tabs;
  }

  List<Widget> getTabContents() {
    return [
      FormScreen(),
      DateTimePickerScreen(),
      AddressForm(),
      FeedbackForm(),
      PersonalInformationForm(),
    ];
  }
}
