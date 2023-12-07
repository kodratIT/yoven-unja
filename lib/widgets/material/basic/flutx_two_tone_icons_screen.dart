import 'package:jambicraff/helpers/theme/app_theme.dart';
import 'package:jambicraff/helpers/widgets/my_spacing.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class FxTwoToneIconsScreen extends StatefulWidget {
  @override
  _FxTwoToneIconsScreenState createState() => _FxTwoToneIconsScreenState();
}

class _FxTwoToneIconsScreenState extends State<FxTwoToneIconsScreen> {
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
        padding: MySpacing.vertical(16),
        children: [
          GridView.count(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              crossAxisCount: 4,
              padding: MySpacing.all(8),
              mainAxisSpacing: 24,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 24,
              children: <Widget>[
                Icon(
                  LucideIcons.circle,
                  color: customTheme.violet,
                ),
                Icon(
                  LucideIcons.plusCircle,
                  color: customTheme.violet,
                ),
                Icon(
                  LucideIcons.playCircle,
                  color: customTheme.violet,
                ),
                Icon(
                  LucideIcons.userCircle,
                  color: customTheme.violet,
                ),
                Icon(
                  LucideIcons.checkSquare,
                  color: customTheme.indigo,
                ),
                Icon(
                  LucideIcons.plusSquare,
                  color: customTheme.indigo,
                ),
                Icon(
                  LucideIcons.projector,
                  color: customTheme.indigo,
                ),
                Icon(
                  LucideIcons.userSquare,
                  color: customTheme.indigo,
                ),
                Icon(
                  LucideIcons.triangle,
                  color: CustomTheme.blue,
                ),
                Icon(
                  LucideIcons.alertTriangle,
                  color: CustomTheme.blue,
                ),
                Icon(
                  Icons.details,
                  color: CustomTheme.blue,
                ),
                Icon(
                  Icons.eject,
                  color: CustomTheme.blue,
                ),
                Icon(
                  LucideIcons.smile,
                  color: CustomTheme.green,
                ),
                Icon(
                  LucideIcons.laugh,
                  color: CustomTheme.green,
                ),
                Icon(
                  LucideIcons.meh,
                  color: CustomTheme.green,
                ),
                Icon(
                  LucideIcons.angry,
                  color: CustomTheme.green,
                ),
                Icon(
                  LucideIcons.home,
                  color: CustomTheme.orange,
                ),
                Icon(
                  LucideIcons.school,
                  color: CustomTheme.orange,
                ),
                Icon(
                  LucideIcons.rockingChair,
                  color: CustomTheme.orange,
                ),
                Icon(
                  Icons.night_shelter,
                  color: CustomTheme.orange,
                ),
                Icon(
                  Icons.admin_panel_settings,
                  color: CustomTheme.red,
                ),
                Icon(
                  LucideIcons.bookmark,
                  color: CustomTheme.red,
                ),
                Icon(
                  Icons.extension,
                  color: CustomTheme.red,
                ),
                Icon(
                  LucideIcons.hand,
                  color: CustomTheme.red,
                ),
                Icon(
                  LucideIcons.star,
                  color: CustomTheme.green,
                ),
                Icon(
                  LucideIcons.starHalf,
                  color: CustomTheme.green,
                ),
                Icon(
                  LucideIcons.star,
                  color: CustomTheme.green,
                ),
                Icon(
                  LucideIcons.badgeCheck,
                  color: CustomTheme.green,
                ),
              ]),
        ],
      ),
    );
  }
}
